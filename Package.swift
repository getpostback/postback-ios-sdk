// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PostbackSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "PostbackSDK",
            targets: ["PostbackSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "PostbackSDK",
            url: "https://github.com/getpostback/postback-ios-sdk/releases/download/v1.1.0/PostbackSDK.xcframework.zip",
            checksum: "d3b1b62b80d4705ce8b94b240b1e5eaa7a153e62335ca0ea1434d44c913071da"
        )
    ]
)
