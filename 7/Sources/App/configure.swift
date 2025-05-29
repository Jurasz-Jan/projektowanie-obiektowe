// Sources/App/configure.swift
import Vapor
import Fluent
import FluentSQLiteDriver
import Leaf

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // Używamy SQLite, nazwa pliku bazy danych to 'db.sqlite' w katalogu /app/db kontenera
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    // Rejestracja migracji
    app.migrations.add(CreateProducts())
    app.migrations.add(CreateCategories())
    app.migrations.add(CreateProductCategoryPivot()) // Dodajemy migrację dla relacji

    // Konfiguracja silnika szablonów Leaf
    app.views.use(.leaf)
    app.leaf.configuration.rootDirectory = "/app/Resources/Views"
    app.leaf.cache.isEnabled = false
    // register routes
    try routes(app)
}