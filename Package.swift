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
            path: "Sources",
            resources: [
                .process("NatDS/Resources/Images.xcassets"),
                .process("NatDS/Resources/Fonts")
            ]
        )
    ]
)
