// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "VaporCRUD", // Nazwa Twojego projektu - ważne, żeby tu było "VaporCRUD"
    platforms: [
       .macOS(.v12),
       .iOS(.v15),
       .tvOS(.v15),
       .watchOS(.v8)
    ],
    dependencies: [
       
        .package(url: "https://github.com/vapor/vapor.git", from: "4.92.0"),
        
        .package(url: "https://github.com/vapor/fluent.git", from: "4.9.0"),
        
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.8.0"),
        
        .package(url: "https://github.com/vapor/leaf.git", from: "4.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "App", 
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "Leaf", package: "leaf"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "AppTests",
            dependencies: [
                .target(name: "App"),
                .product(name: "XCTVapor", package: "vapor"),
            ],
            swiftSettings: swiftSettings
        )
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableUpcomingFeature("BareSlashRegexLiterals")
] }