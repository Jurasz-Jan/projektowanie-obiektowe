// Sources/App/Migrations/CreateCategories.swift
import Fluent

struct CreateCategories: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("categories")
            .id()
            .field("name", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("categories").delete()
    }
}