// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "FolioReaderKit",
    platforms: [
        .macOS(.v10_10), .iOS(.v12), .tvOS(.v9), .watchOS(.v3)
    ],
    products: [
        .library(name: "FolioReaderKit", targets: ["FolioReaderKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/playstonex/ZipArchive.git", .branch("master")),
        .package(url: "https://github.com/cxa/MenuItemKit.git", from: "4.0.1"),
        .package(url: "https://github.com/playstonex/ZFDragableModalTransition.git", .branch("master")),
        .package(url: "https://github.com/tadija/AEXML.git", from: "4.6.0"),
        .package(url: "https://github.com/ArtSabintsev/FontBlaster.git", from: "5.1.1"),
        .package(url: "https://github.com/realm/realm-cocoa.git",from: "10.1.1"),
    ],
    targets: [
        .target(name: "FolioReaderKit",dependencies: ["ZipArchive","MenuItemKit","ZFDragableModalTransition","AEXML","FontBlaster","Realm", "RealmSwift"], path: "Source")
    ]
    
)
