// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LogHandler",
    platforms: [
        .macOS(.v11), .iOS(.v14), .watchOS(.v7), .tvOS(.v14)
    ],
    products: [
        .library(
            name: "LogHandler",
            targets: ["LogHandler"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "LogHandler",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
            ]),
        .testTarget(
            name: "LogHandlerTests",
            dependencies: ["LogHandler"]),
    ]
)
