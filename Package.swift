// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KittyLight",
    platforms: [.iOS(.v15)],
    products: [
        .executable(
            name: "KittyLight",
            targets: ["KittyLight"])
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "KittyLight",
            dependencies: [],
            path: "Sources")
    ]
)
