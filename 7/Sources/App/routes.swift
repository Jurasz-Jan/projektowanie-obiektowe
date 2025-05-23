import Vapor

func routes(_ app: Application) throws {
    let productController = ProductController()
    let categoryController = CategoryController()
    let userController = UserController()

    app.get { req in
        return req.view.render("index")
    }

    try app.register(collection: productController)
    try app.register(collection: categoryController)
    try app.register(collection: userController)
}
