import Vapor
import Fluent
import FluentSQLiteDriver
import Leaf
import Redis

public func configure(_ app: Application) throws {
    // Ustaw bazę danych (SQLite)
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    // Redis config
    if let redisHost = Environment.get("REDIS_HOST") {
        try app.redis.configuration = RedisConfiguration(hostname: redisHost)
    }

    // Ustaw Leaf jako silnik widoków
    app.views.use(.leaf)

    // Dodaj migracje
    app.migrations.add(CreateProduct())
    app.migrations.add(CreateCategory())
    app.migrations.add(CreateUser())

    // Uruchom migracje przy starcie
    try app.autoMigrate().wait()

    // Zarejestruj trasy
    try routes(app)
}
