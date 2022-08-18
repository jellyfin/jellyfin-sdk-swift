// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JellyfinAPI",
    platforms: [
        .iOS(.v13),
        .macCatalyst(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "JellyfinAPI", targets: ["JellyfinAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Get", from: "1.0.2"),
        .package(url: "https://github.com/CreateAPI/URLQueryEncoder", from: "0.2.0"),
    ],
    targets: [
        .target(
            name: "JellyfinAPI",
            dependencies: [
                .product(name: "Get", package: "Get"),
                .product(name: "URLQueryEncoder", package: "URLQueryEncoder"),
            ],
            path: "Sources",
            exclude: [
                "jellyfin-openapi-stable.json",
                "create-api-config.yaml",
            ]
        ),
        .binaryTarget(
            name: "create-api",
            url: "https://github.com/CreateAPI/CreateAPI/releases/download/0.1.0/create-api.artifactbundle.zip",
            checksum: "4e9d1fb023c52e423d57de0928da5d943e3e4c81f6cb903523654867e6372db7"
        ),
        .plugin(
            name: "CreateAPI",
            capability: .command(
                intent: .custom(
                    verb: "generate-api",
                    description: "Generates the OpenAPI entities and paths using CreateAPI"
                ),
                permissions: [
                    .writeToPackageDirectory(reason: "To output the generated source code"),
                ]
            ),
            dependencies: [
                .target(name: "create-api"),
            ]
        ),
    ]
)
