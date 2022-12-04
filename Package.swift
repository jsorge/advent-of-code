// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

func generateTargets() -> [Target] {
    let years = [
        2021,
        2022,
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
        .testTarget(
            name: "AOCCoreTests",
            dependencies: [
                "AOCCore"
            ]),
        .target(
            name: "TestingSupport",
            dependencies: []
        ),
    ]

    for year in years {
        executable.dependencies.append(.target(name: "AOC\(year)"))
        let dayRange = 1...25
        let sourcePaths = dayRange.map({ "Day\($0)/Day\($0).swift" })
        let testPaths = dayRange.map({ "Day\($0)/Day\($0)Tests.swift" })
        let resourcePaths = dayRange.map({ "Day\($0)/Day\($0).input" })
        let inputPaths: [Resource] = resourcePaths.map({ .process($0) })

        allTargets.append(contentsOf: [
            .target(
                name: "AOC\(year)",
                dependencies: ["AOCCore"],
                path: "Years/\(year)",
                exclude: testPaths + resourcePaths,
                sources: sourcePaths
            ),
            .testTarget(
                name: "\(year)Tests",
                dependencies: [
                    .target(name: "AOC\(year)"),
                    "TestingSupport",
                ],
                path: "Years/\(year)",
                exclude: sourcePaths,
                sources: testPaths,
                resources: inputPaths
            ),
        ])
    }

    return allTargets
}

let package = Package(
    name: "advent-of-code",
    platforms: [.macOS(.v13)],
    dependencies: [
         .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.0.0"),
         .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
         .package(url: "https://github.com/apple/swift-collections.git", .upToNextMajor(from: "1.0.1")),
    ],
    targets: generateTargets()
)
