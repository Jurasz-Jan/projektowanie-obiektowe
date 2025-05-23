import Vapor
import Fluent

struct UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.get(use: index)
        users.post(use: store)
    }

    func index(req: Request) async throws -> View {
        let users = try await User.query(on: req.db).all()

        // Zapisz ostatniego użytkownika do Redis
        if let redis = req.redis {
            if let last = users.last {
                try await redis.set("last_user", toJSON: last)
            }
        }

        return try await req.view.render("users", ["users": users])
    }

    func store(req: Request) async throws -> Response {
        let user = try req.content.decode(User.self)
        try await user.save(on: req.db)
        return req.redirect(to: "/users")
    }
}
