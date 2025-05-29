// Sources/App/Models/Category.swift
import Fluent
import Vapor

final class Category: Model, Content, Equatable { // <-- This line is correct now!
    static let schema = "categories"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Siblings(through: ProductCategory.self, from: \.$category, to: \.$product)
    var products: [Product]

    

    init() { }

    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }

    
    static func == (lhs: Category, rhs: Category) -> Bool {
       lhs.id == rhs.id
    }
    
}