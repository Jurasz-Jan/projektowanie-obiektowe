import Vapor
import Fluent
import FluentSQLiteDriver
import Leaf
import Redis

public func configure(_ app: Application) throws {
    // Leaf (HTML templates)
    app.views.use(.leaf)

    // SQLite database
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    // Redis
    if let redisURL = Environment.get("REDIS_HOST") {
        try app.redis.configuration = try RedisConfiguration(hostname: redisURL)
    }

    // Fluent migration support
    app.migrations.add(CreateProduct())

    // Register routes
    try routes(app)
}
