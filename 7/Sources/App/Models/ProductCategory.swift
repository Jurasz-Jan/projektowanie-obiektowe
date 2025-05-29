// ProductCategory.swift (The Pivot Model)
import Fluent
import Vapor

final class ProductCategory: Model, Content {
    static let schema = "product_categories"

    @ID(key: .id)
    var id: UUID? // Your warning for this `var` id is typically fine here

    @Parent(key: "product_id")
    var product: Product

    @Parent(key: "category_id")
    var category: Category

    init() { }

    init(id: UUID? = nil, product: Product, category: Category) throws {
        self.id = id
        self.$product.id = try product.requireID()
        self.$category.id = try category.requireID()
    }
}