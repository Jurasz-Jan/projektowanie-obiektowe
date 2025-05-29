// Product.swift
import Fluent
import Vapor

final class Product: Model, Content {
    static let schema = "products"

    @ID(key: .id)
    var id: UUID? // Your warning for this `var` id is typically fine here

    @Field(key: "name")
    var name: String

    @Field(key: "description")
    var description: String

    @Field(key: "price")
    var price: Double

    // Define the many-to-many relationship
    @Siblings(through: ProductCategory.self, from: \.$product, to: \.$category)
    public var categories: [Category] // Make sure this is public

    init() { }

    init(id: UUID? = nil, name: String, description: String, price: Double) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
    }
}