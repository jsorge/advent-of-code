// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

func generateTargets() -> [Target] {
    let years = [
        2021
    ]

    let executable: Target = .executableTarget(
        name: "advent-of-code",
        dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
        ]
    )

    var allTargets: [Target] = [
        executable,
        .target(
            name: "AOCCore",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
            ]),
    ]

    for year in years {
        executable.dependencies.append(.target(name: "AOC\(year)"))

        allTargets.append(contentsOf: [
            .target(
                name: "AOC\(year)",
                dependencies: ["AOCCore"]),
            .testTarget(
                name: "\(year)Tests",
                dependencies: [
                    .target(name: "AOC\(year)")
                ],
                resources: [
                    .copy("Fixtures"),
                ]),
        ])
    }

    return allTargets
}

let package = Package(
    name: "advent-of-code",
    dependencies: [
         .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.0.0"),
         .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: generateTargets()
)
