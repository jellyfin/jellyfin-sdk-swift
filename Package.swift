// swift-tools-version:6.0
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
        .plugin(name: "GenerateAPI", targets: ["GenerateAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Get", from: "2.1.6"),
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
                "openapi-generator.yaml",
            ]
        ),
        .binaryTarget(
            name: "openapi-generator",
            url: "https://github.com/LePips/openapi-generator/releases/download/v0.6.0/openapi-generator.artifactbundle.zip",
            checksum: "4721af17006e512b5cd7f84200f22513da506d2031d24a6e500762704a1bf2f2"
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
    ]
)
