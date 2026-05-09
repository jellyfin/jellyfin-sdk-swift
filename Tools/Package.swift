// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Tools",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .executable(name: "tools", targets: ["Tools"]),
    ],
    dependencies: [
        .package(name: "jellyfin-sdk-swift", path: ".."),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.7.0"),
    ],
    targets: [
        .executableTarget(
            name: "Tools",
            dependencies: [
                .product(name: "JellyfinAPI", package: "jellyfin-sdk-swift"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
    ]
)
