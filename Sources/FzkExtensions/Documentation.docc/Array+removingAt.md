# Array.removing(at index:)

Non-mutating way to remove a single item and return the resulting array.


## Overview

`Array` has a mutating function `remove(at index:)`, which mutates the array and returns the removed item.

But this requires the array to be mutable, and it cannot be easily chained with other non-mutating functions like `sorted()`, `filter(_;)` and `map(_:)`.


## Example

```swift
// Immutable array
let array = [1,2,3]

let newArray = array.removing(at: 2).map { $0 + 1 }
```

## See Also

- ``FzkExtensions/Swift/Array/removing(at:)``
