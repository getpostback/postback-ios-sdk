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
            url: "https://github.com/getpostback/postback-ios-sdk/releases/download/v1.0.0/PostbackSDK.xcframework.zip",
            checksum: "d82a6e5deff5b34b060a4eec88753842733b724feb361c1a634d3fcbb531269a"
        )
    ]
)
