// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JellyfinAPI",
    platforms: [
        .iOS(.v16),
        .macCatalyst(.v16),
        .macOS(.v13),
        .watchOS(.v9),
        .tvOS(.v16),
    ],
    products: [
        .library(name: "JellyfinAPI", targets: ["JellyfinAPI"]),
        .plugin(name: "GenerateAPI", targets: ["GenerateAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Get", from: "2.1.6"),
        .package(url: "https://github.com/apple/swift-nio-transport-services.git", from: "1.17.2"),
    ],
    targets: [
        .target(
            name: "JellyfinAPI",
            dependencies: [
                .product(name: "Get", package: "Get"),
                .product(name: "NIOTransportServices", package: "swift-nio-transport-services"),
            ],
            path: "Sources",
            exclude: [
                "openapi-generator.yaml",
            ]
        ),
        .binaryTarget(
            name: "openapi-generator",
            url: "https://github.com/LePips/openapi-generator/releases/download/v0.7.1/openapi-generator.artifactbundle.zip",
            checksum: "a882367e67ddb2d23b596992dcde77d522b0c5e7301afe5c49d9c8c6523f8aca"
        ),
        .plugin(
            name: "GenerateAPI",
            capability: .command(
                intent: .custom(
                    verb: "generate-api",
                    description: "Generate Jellyfin API sources."
                ),
                permissions: [
                    .writeToPackageDirectory(reason: "Generated Swift sources are written into the package directory."),
                ]
            ),
            dependencies: [
                .target(name: "openapi-generator"),
            ],
            path: "Plugins/GenerateAPI"
        ),
        .testTarget(
            name: "JellyfinAPITests",
            dependencies: ["JellyfinAPI"]
        ),
    ]
)
