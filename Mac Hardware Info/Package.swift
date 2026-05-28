import PackageDescription

let package = Package(
    name: "macinfo",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "macinfo",
            targets: ["macinfo"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.25.0")
    ],
    targets: [
        .executableTarget(
            name: "macinfo",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "swift-protobuf")
            ],
            path: "Sources/macinfo"
        )
    ]
)
