// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AutoLayoutHelpers",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .macCatalyst(.v13),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "AutoLayoutHelpers",
            targets: ["AutoLayoutHelpers"]
        )
    ],
    targets: [
        .target(
            name: "AutoLayoutHelpers",
            dependencies: []
        ),
        .testTarget(
            name: "AutoLayoutHelpersTests",
            dependencies: ["AutoLayoutHelpers"]
        )
    ]
)
