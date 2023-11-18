// swift-tools-version: 5.6

import PackageDescription

let package = Package(
	name: "swift-extensions",
	products: [
		.library(
			name: "FzkExtensions",
			targets: [
				"FzkExtensions"
			]
		),
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
	],
	targets: [
		.target(
			name: "FzkExtensions",
			dependencies: []
		),
		.testTarget(
			name: "ExtensionsTests",
			dependencies: ["FzkExtensions"]
		),
	]
)
