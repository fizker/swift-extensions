# RandomAccessCollection+[safe:]

Safely retrieving an element from a RandomAccessCollection.


## Overview

Accessing a `RandomAccessCollection` like `Array` by index might produce a fatal error, if the index is out of bounds.

This adds a subscript function that will instead return an `Optional` which is `nil` if the index is out of bounds.


## Example

```swift
let array = [1,2,3]
assert(array[safe: -1] == nil)
assert(array[safe: 0] == 1)
assert(array[safe: 1] == 2)
assert(array[safe: 2] == 3)
assert(array[safe: 3] == nil)
```
