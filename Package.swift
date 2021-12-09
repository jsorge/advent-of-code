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
                .product(name: "Collections", package: "swift-collections"),
            ]),
        .target(
            name: "TestingSupport",
            dependencies: []
        ),
    ]

    for year in years {
        executable.dependencies.append(.target(name: "AOC\(year)"))

        allTargets.append(contentsOf: [
            .target(
                name: "AOC\(year)",
                dependencies: ["AOCCore"],
                path: "Years/\(year)/Sources"
            ),
            .testTarget(
                name: "\(year)Tests",
                dependencies: [
                    .target(name: "AOC\(year)"),
                    "TestingSupport",
                ],
                path: "Years/\(year)/Tests",
                resources: [
                    .copy("Fixtures"),
                ]
            ),
        ])
    }

    return allTargets
}

let package = Package(
    name: "advent-of-code",
    dependencies: [
         .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.0.0"),
         .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
         .package(url: "https://github.com/apple/swift-collections.git", .upToNextMajor(from: "1.0.1")),
    ],
    targets: generateTargets()
)
