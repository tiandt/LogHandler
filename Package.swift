// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LogHandler",
    platforms: [
        .macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v7), .visionOS(.v1)
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
            ],
            swiftSettings: swiftSettings
	),
        .testTarget(
            name: "LogHandlerTests",
            dependencies: ["LogHandler"]),
    ]
)

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("StrictConcurrency"),
    .define("CONSOLE_PRINT", .when(configuration: .debug)), // 控制台输出总开关，release包就不输出了
    .define("STUDIO_PRINT", .when(configuration: .debug)), // print输出总开关，release包就不输出了
]
