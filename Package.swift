// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

func generateTargets() -> [Target] {
    let years = [
        2021
    ]

    var allTargets: [Target] = [
        .executableTarget(
            name: "advent-of-code",
            dependencies: []),
        .target(
            name: "AOCCore",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
            ]),
    ]

    for year in years {
        allTargets.append(contentsOf: [
            .target(
                name: "\(year)",
                dependencies: ["AOCCore"]),
            .testTarget(
                name: "\(year)Tests",
                dependencies: [
                    .targetItem(name: "\(year)", condition: nil)
                ]),
        ])
    }

    return allTargets
}

let package = Package(
    name: "advent-of-code",
    dependencies: [
         .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.0.0"),
         
    ],
    targets: generateTargets()
)
