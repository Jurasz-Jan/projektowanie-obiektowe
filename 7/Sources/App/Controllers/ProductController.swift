// Sources/App/Controllers/ProductController.swift
import Fluent
import Vapor
import Leaf

struct ProductController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let products = routes.grouped("products")

        // READ All
        products.get { req async throws -> View in
            let products = try await Product.query(on: req.db).all()
            // Tutaj Leaf automatycznie inferuje typ, więc to jest OK
            return try await req.view.render("products/index", ["products": products])
        }

        // CREATE - Show Form
        products.get("create") { req async throws -> View in
            let categories = try await Category.query(on: req.db).all()
            // Tutaj Leaf automatycznie inferuje typ, to też jest OK
            return try await req.view.render("products/create", ["categories": categories])
        }

        // CREATE - Save Product
        products.post { req async throws -> Response in
            struct ProductCreateForm: Content {
                var name: String
                var description: String
                var price: Double
                var categoryIDs: [String]? // IDs as strings to handle checkboxes
            }
            let data = try req.content.decode(ProductCreateForm.self)
            let product = Product(name: data.name, description: data.description, price: data.price)
            try await product.save(on: req.db)

            if let categoryIDs = data.categoryIDs {
                for categoryIDString in categoryIDs {
                    if let categoryID = UUID(uuidString: categoryIDString),
                       let category = try await Category.find(categoryID, on: req.db) {
                        try await product.$categories.attach(category, on: req.db)
                    }
                }
            }
            return req.redirect(to: "/products")
        }

        // READ Single
        products.get(":productID") { req async throws -> View in
            guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
                throw Abort(.notFound)
            }
            try await product.$categories.load(on: req.db) // Load associated categories
            // Tutaj Leaf automatycznie inferuje typ, to jest OK
            return try await req.view.render("products/show", ["product": product])
        }

        // UPDATE - Show Form
        products.get(":productID", "edit") { req async throws -> View in
            guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
                throw Abort(.notFound)
            }
            try await product.$categories.load(on: req.db)
            let allCategories = try await Category.query(on: req.db).all()

            // FIX: Create a dedicated context struct for rendering multiple types
            struct ProductEditContext: Content {
                let product: Product
                let allCategories: [Category] // Zmieniona nazwa klucza na spójną z renderowaniem
                let selectedCategoryIDs: [String] // Aby łatwo zaznaczyć wybrane kategorie w szablonie
            }
            
            let selectedCategoryIDs = product.categories.compactMap { $0.id?.uuidString } // Pobierz ID już przypisanych kategorii

            let context = ProductEditContext(
                product: product,
                allCategories: allCategories,
                selectedCategoryIDs: selectedCategoryIDs
            )
            
            return try await req.view.render("products/edit", context) // Przekazujemy cały kontekst
        }

        // UPDATE - Save Changes
        products.post(":productID", "edit") { req async throws -> Response in
            struct ProductUpdateForm: Content {
                var name: String
                var description: String
                var price: Double
                var categoryIDs: [String]?
            }
            guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
                throw Abort(.notFound)
            }
            let data = try req.content.decode(ProductUpdateForm.self)

            product.name = data.name
            product.description = data.description
            product.price = data.price
            try await product.save(on: req.db)

            // FIX: Use `replace` for efficient category updates or detach with arguments
            // `replace` jest bardziej efektywne: najpierw odłącza wszystkie istniejące,
            // a potem dołącza te, które przekazujemy.
            var newCategories: [Category] = []
            if let categoryIDs = data.categoryIDs {
                for categoryIDString in categoryIDs {
                    if let categoryID = UUID(uuidString: categoryIDString),
                       let category = try await Category.find(categoryID, on: req.db) {
                        newCategories.append(category)
                    }
                }
            }
            try await product.$categories.load(on: req.db)
let currentCategories = product.categories // This will be [Category]

// 1. Determine which categories to DETACH:
// These are categories currently associated with the product,
// but NOT present in the newCategories list.
let categoriesToDetach = currentCategories.filter { currentCategory in
    !newCategories.contains(where: { $0.id == currentCategory.id })
}

// 2. Determine which categories to ATTACH:
// These are categories from newCategories that are NOT currently
// associated with the product.
let categoriesToAttach = newCategories.filter { newCategory in
    !currentCategories.contains(where: { $0.id == newCategory.id })
}

// Perform the detach operations
for category in categoriesToDetach {
    try await product.$categories.detach(category, on: req.db)
}

// Perform the attach operations
for category in categoriesToAttach {
    try await product.$categories.attach(category, on: req.db)
}

// ... (rest of your code, like redirect)
return req.redirect(to: "/products/\(product.id!.uuidString)")
        }

        // DELETE
        products.post(":productID", "delete") { req async throws -> Response in
            guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
                throw Abort(.notFound)
            }
            try await product.delete(on: req.db)
            return req.redirect(to: "/products")
        }
    }
}