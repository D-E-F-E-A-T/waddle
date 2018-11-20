// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "waddle",
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "1.3.2"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "7.0.1"),
    ],
    targets: [
        .target(
            name: "TaskDescription",
            dependencies: []),
        .target(
            name: "waddle",
            dependencies: []),
        .testTarget(
            name: "TaskDescriptionTests",
            dependencies: ["TaskDescription", "Quick", "Nimble"]),
    ]
)
