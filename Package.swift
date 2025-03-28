// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Build_25_03_28",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Build_25_03_28",
            targets: ["Build_25_03_28"])
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "10.29.0")),
        .package(url: "https://github.com/google/GoogleSignIn-iOS.git", .upToNextMajor(from: "7.1.0"))
    ],
    targets: [
        .target(
            name: "Build_25_03_28",
            dependencies: [
                .product(name: "FirebaseCore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
                .product(name: "GoogleSignInSwift", package: "GoogleSignIn-iOS")
            ]
        )
    ]
) 