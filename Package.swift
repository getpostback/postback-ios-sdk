// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppSprintSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "AppSprintSDK",
            targets: ["AppSprintSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "AppSprintSDK",
            url: "https://github.com/getappsprint/appsprint-ios-sdk/releases/download/v1.1.9/AppSprintSDK.xcframework.zip",
            checksum: "6b34fa945fe096b4ab852d84db5c3ff7c38d285e9b67b13546d64a87ca3f3138"
        )
    ]
)
