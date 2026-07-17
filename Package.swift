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
            checksum: "50ea7244059e02795d1dbe43029cf262132633294982be7e3ff57655863f9412"
        )
    ]
)
