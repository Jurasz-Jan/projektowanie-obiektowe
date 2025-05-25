import Vapor

func routes(_ app: Application) throws {
    // Strona główna
    app.get { req in
        return req.view.render("index")
    }

    // Prosty test tekstowy
    app.get("test") { req in
        return "Działa!"
    }

    // Produkty
    try app.register(collection: ProductController())
}
