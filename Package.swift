// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "apache-arrow-swift",
    products: [
        .library(
            name: "ApacheArrow",
            targets: ["ApacheArrow"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ApacheArrow",
            dependencies: ["ApacheArrowGlib"]),
        .systemLibrary(
            name: "ApacheArrowGlib",
            providers: [
                .brew(["apache-arrow-glib"]),
            ]
        ),
        .testTarget(
            name: "ApacheArrowTests",
            dependencies: ["ApacheArrow"]),
    ]
)
