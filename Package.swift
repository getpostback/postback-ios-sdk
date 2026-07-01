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
            url: "https://github.com/getappsprint/appsprint-ios-sdk/releases/download/v1.1.10/AppSprintSDK.xcframework.zip",
            checksum: "63a195b92d2f8aca3cf2546bb9d4f14b775facd245c5f0b6922ab0ee9d63abb0"
        )
    ]
)
