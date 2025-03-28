// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CheemHang_03_25",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "CheemHang_03_25",
            targets: ["CheemHang_03_25"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.29.0"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS.git", from: "7.1.0")
    ],
    targets: [
        .target(
            name: "CheemHang_03_25",
            dependencies: [
                .product(name: "FirebaseCore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
                .product(name: "GoogleSignInSwift", package: "GoogleSignIn-iOS")
            ])
    ]
) 