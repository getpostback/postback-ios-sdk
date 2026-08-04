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
            url: "https://github.com/getpostback/postback-ios-sdk/releases/download/v1.0.2/PostbackSDK.xcframework.zip",
            checksum: "c5500a461a42da4c5edd09aa5ce9f9b449ea704848ee3c3fb5045d5e02abd7e7"
        )
    ]
)
