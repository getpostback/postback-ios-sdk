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
            url: "https://github.com/getpostback/postback-ios-sdk/releases/download/v1.0.1/PostbackSDK.xcframework.zip",
            checksum: "54319878642fc68c4d51afcf7b2c9f177071f64abc3ba386094c47e5b2bf25a6"
        )
    ]
)
