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
            url: "https://github.com/getpostback/postback-ios-sdk/releases/download/v2.0.0/PostbackSDK.xcframework.zip",
            checksum: "a7242f3bcc96a1797983bd56c9f2b3aa11404830a4f82ab06548c2366fee0c9e"
        )
    ]
)
