# Extensions for Swift

A collection of small extensions and custom operators.

[DocC documentation](https://fizker.github.io/swift-extensions/documentation/fzkextensions/)


## How to use

1. Add `.package(url: "https://github.com/fizker/swift-extensions.git", from:"1.0.0")` to the list of dependencies in your Package.swift file.
2. Add `.product(name: "FzkExtensions", package: "swift-extensions")` to the dependencies of the targets that need to use the models.
3. Add `import FzkExtensions` to a file to gain access to the extensions and operators.


## Extensions

Array#removing(at index:)

```swift
let measurements: [Double] = [1.1, 1.5, 2.9, 1.2, 1.5, 1.3, 1.2]
let removed = measurements.removing(at: 2)
print(removed)
// Prints "[1.1, 1.5, 1.2, 1.5, 1.3, 1.2]"
```

RandomAccessCollection#[safe index:]

```swift
let array = [1,2,3]
assert(array[safe: -1] == nil)
assert(array[safe: 0] == 1)
assert(array[safe: 1] == 2)
assert(array[safe: 2] == 3)
assert(array[safe: 3] == nil)
```


## Operators

Configurator `~`

```swift
let view = UIView()
view.addGestureRecognizer(UITapGestureRecognizer() ~ {
    $0.numberOfTapsRequired = 2
    $0.modifierFlags = [ .command ]
})
```

Optional set `??=`

```swift
// Given the class Foo
class Foo {
    var bar: Int?
}

func ensureValue(foo: Foo) {
    // If foo.bar is nil, it now becomes 1.
    // If it is not nil, it will remain unchanged.
    foo.bar ??= 1
}
```
