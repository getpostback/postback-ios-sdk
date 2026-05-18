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
            url: "https://github.com/getappsprint/appsprint-ios-sdk/releases/download/v1.1.3/AppSprintSDK.xcframework.zip",
            checksum: "0237ea24ec32c51c920cb71a19e074b1ab2c9444fe7ca77ca86b074ac62cc848"
        )
    ]
)
