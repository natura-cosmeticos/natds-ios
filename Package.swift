// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "NatDS",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "NatDS",
            targets: ["NatDS"])
    ],
    targets: [
        .target(
            name: "NatDS",
            dependencies: ["NatDSResources"],
            path: "Sources"
        ),
        .target(
            name: "NatDSResources",
            path: "Sources/Resources",
            resources: [
                .process("Images.xcassets"),
                .copy("Fonts")
            ]
        )
    ]
)
