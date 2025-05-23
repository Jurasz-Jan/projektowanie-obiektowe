import Vapor
import Fluent

final class Category: Model, Content {
    static let schema = "categories"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String

    @Children(for: \.$category)
    var products: [Product]

    init() {}

    init(title: String) {
        self.title = title
    }
}
