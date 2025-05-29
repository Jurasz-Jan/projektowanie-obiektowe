// Sources/App/Migrations/CreateProductCategoryPivot.swift
import Fluent

struct CreateProductCategoryPivot: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("product_categories")
            .id()
            .field("product_id", .uuid, .required, .references("products", "id"))
            .field("category_id", .uuid, .required, .references("categories", "id"))
            .unique(on: "product_id", "category_id")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("product_category").delete()
    }
}