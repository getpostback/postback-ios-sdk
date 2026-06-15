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
            url: "https://github.com/getappsprint/appsprint-ios-sdk/releases/download/v1.1.8/AppSprintSDK.xcframework.zip",
            checksum: "897312ee2ba4c874da7521397524532a237b3635bb1c3d2ef23ac2ebdab0ec80"
        )
    ]
)
