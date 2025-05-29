// Sources/App/routes.swift
import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws in
        return try await req.view.render("welcome")
    }

    try app.register(collection: ProductController())
    try app.register(collection: CategoryController())
}