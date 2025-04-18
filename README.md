# Extensions for Swift

A collection of small extensions and custom operators.

[DocC documentation](https://fizker.github.io/swift-extensions/documentation/fzkextensions/)


## How to use

1. Add `.package(url: "https://github.com/fizker/swift-extensions.git", from: "1.4.0")` to the list of dependencies in your Package.swift file.
2. Add `.product(name: "FzkExtensions", package: "swift-extensions")` to the dependencies of the targets that need to use the models.
3. Add `import FzkExtensions` to a file to gain access to the extensions and operators.
