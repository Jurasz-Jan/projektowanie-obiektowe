import Vapor
import Fluent

struct CategoryController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let categories = routes.grouped("categories")
        categories.get(use: index)
        categories.post(use: store)
    }

    func index(req: Request) async throws -> View {
        let categories = try await Category.query(on: req.db).with(\.$products).all()
        return try await req.view.render("categories", ["categories": categories])
    }

    func store(req: Request) async throws -> Response {
        let category = try req.content.decode(Category.self)
        try await category.save(on: req.db)
        return req.redirect(to: "/categories")
    }
}
