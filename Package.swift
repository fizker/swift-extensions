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
