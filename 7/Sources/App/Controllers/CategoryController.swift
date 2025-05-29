// Sources/App/Controllers/CategoryController.swift
import Fluent
import Vapor
import Leaf

struct CategoryController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let categories = routes.grouped("categories")

        // READ All
        categories.get { req async throws -> View in
            let categories = try await Category.query(on: req.db).all()
            return try await req.view.render("categories/index", ["categories": categories])
        }

        // CREATE - Show Form
        categories.get("create") { req async throws -> View in
            return try await req.view.render("categories/create")
        }

        // CREATE - Save Category
categories.post { req async throws -> Response in
    struct CategoryCreateData: Content {
        let name: String
    }
    
    let data = try req.content.decode(CategoryCreateData.self)
    let category = Category(name: data.name)
    try await category.save(on: req.db)
    return req.redirect(to: "/categories")
}
        // READ Single
        categories.get(":categoryID") { req async throws -> View in
            guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
                throw Abort(.notFound)
            }
            try await category.$products.load(on: req.db) // Load associated products
            return try await req.view.render("categories/show", ["category": category])
        }

        // UPDATE - Show Form
        categories.get(":categoryID", "edit") { req async throws -> View in
            guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
                throw Abort(.notFound)
            }
            return try await req.view.render("categories/edit", ["category": category])
        }

        // UPDATE - Save Changes
categories.post(":categoryID", "edit") { req async throws -> Response in
    struct CategoryUpdateData: Content {
        let name: String
    }
    
    guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
        throw Abort(.notFound)
    }
    
    let data = try req.content.decode(CategoryUpdateData.self)
    category.name = data.name
    try await category.save(on: req.db)
    return req.redirect(to: "/categories/\(category.id!.uuidString)")
}

        // DELETE
        categories.post(":categoryID", "delete") { req async throws -> Response in
            guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
                throw Abort(.notFound)
            }
            try await category.delete(on: req.db)
            return req.redirect(to: "/categories")
        }
    }
}