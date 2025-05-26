// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "VaporAppSimple",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.89.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.6.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.1.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "4.2.4"),
        .package(url: "https://github.com/vapor/redis.git", from: "4.5.0")
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "Leaf", package: "leaf"),
                .product(name: "Redis", package: "redis")
            ],
            path: "Sources/App"
        ),
        .executableTarget(
            name: "Run",
            dependencies: [.target(name: "App")],
            path: "Sources/Run"
        )
    ]
)
