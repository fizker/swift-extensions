// swift-tools-version: 5.6

import PackageDescription

let package = Package(
	name: "swift-extra-operators",
	products: [
		.library(
			name: "ExtraOperators",
			targets: ["ExtraOperators"]
		),
	],
	dependencies: [
	],
	targets: [
		.target(
			name: "ExtraOperators",
			dependencies: []),
		.testTarget(
			name: "ExtraOperatorsTests",
			dependencies: ["ExtraOperators"]
		),
	]
)
