// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JellyfinAPI",
    platforms: [
        .iOS(.v16),
        .macCatalyst(.v13),
        .macOS(.v13),
        .watchOS(.v9),
        .tvOS(.v16),
    ],
    products: [
        .library(name: "JellyfinAPI", targets: ["JellyfinAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Get", from: "2.1.6"),
        .package(url: "https://github.com/CreateAPI/URLQueryEncoder", from: "0.2.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.5.4"),
    ],
    targets: [
        .target(
            name: "JellyfinAPI",
            dependencies: [
                .product(name: "Get", package: "Get"),
                .product(name: "URLQueryEncoder", package: "URLQueryEncoder"),
                .product(name: "Logging", package: "swift-log"),
            ],
            path: "Sources",
            exclude: [
                "jellyfin-openapi-stable.json",
                "create-api-config.yaml",
            ]
        ),
        .binaryTarget(
            name: "create-api",
            url: "https://github.com/CreateAPI/CreateAPI/releases/download/0.2.0/create-api.artifactbundle.zip",
            checksum: "6f8a3ce099f07eb2655ccaf6f66d8c9a09b74bb2307781c4adec36609ddac009"
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

