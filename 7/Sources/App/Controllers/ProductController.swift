import Vapor
import Fluent

struct ProductController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let products = routes.grouped("products")
        products.get(use: index)
        products.get("create", use: create)
        products.post(use: store)
        products.get(":id", "edit", use: edit)
        products.post(":id", "update", use: update)
        products.post(":id", "delete", use: delete)
    }

    func index(req: Request) async throws -> View {
        let products = try await Product.query(on: req.db).with(\.$category).all()
        return try await req.view.render("products", ["products": products])
    }

    func create(req: Request) async throws -> View {
        let categories = try await Category.query(on: req.db).all()
        return try await req.view.render("product_form", ["categories": categories])
    }

    func store(req: Request) async throws -> Response {
        let product = try req.content.decode(Product.self)
        try await product.save(on: req.db)
        return req.redirect(to: "/products")
    }

    func edit(req: Request) async throws -> View {
        guard let id = req.parameters.get("id", as: UUID.self),
              let product = try await Product.find(id, on: req.db) else {
            throw Abort(.notFound)
        }
        let categories = try await Category.query(on: req.db).all()
        return try await req.view.render("product_form", ["product": product, "categories": categories])
    }

    func update(req: Request) async throws -> Response {
        guard let id = req.parameters.get("id", as: UUID.self),
              let product = try await Product.find(id, on: req.db) else {
            throw Abort(.notFound)
        }
        let updated = try req.content.decode(Product.self)
        product.name = updated.name
        product.price = updated.price
        product.$category.id = updated.$category.id
        try await product.update(on: req.db)
        return req.redirect(to: "/products")
    }

    func delete(req: Request) async throws -> Response {
        guard let id = req.parameters.get("id", as: UUID.self),
              let product = try await Product.find(id, on: req.db) else {
            throw Abort(.notFound)
        }
        try await product.delete(on: req.db)
        return req.redirect(to: "/products")
    }
}
