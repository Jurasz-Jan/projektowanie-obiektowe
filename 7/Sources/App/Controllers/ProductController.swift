import Vapor
import Fluent

struct ProductController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let products = routes.grouped("products")
        products.get(use: index)
        products.get("create", use: create)
        products.post(use: store)
    }

    func index(req: Request) async throws -> View {
        let products = try await Product.query(on: req.db).all()
        struct ProductContext: Encodable {
            let products: [Product]
        }
        return try await req.view.render("products", ProductContext(products: products))
    }

    func create(req: Request) async throws -> View {
        return try await req.view.render("product_form")
    }

    func store(req: Request) async throws -> Response {
        let product = try req.content.decode(Product.self)
        try await product.save(on: req.db)
        return req.redirect(to: "/products")
    }
}
