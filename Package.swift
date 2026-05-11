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
            url: "https://github.com/getappsprint/appsprint-ios-sdk/releases/download/v1.0.1/AppSprintSDK.xcframework.zip",
            checksum: "bd6be25601107ff85b9ea7c6697231d968356ccbd98c16feb607be01c488c0b6"
        )
    ]
)
