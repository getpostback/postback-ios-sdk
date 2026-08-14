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
            url: "https://github.com/getpostback/postback-ios-sdk/releases/download/v2.0.1/PostbackSDK.xcframework.zip",
            checksum: "9854150a3d1976d0300770caf8f05e62bd9a09c793ac9d1a96a877bf21016377"
        )
    ]
)
