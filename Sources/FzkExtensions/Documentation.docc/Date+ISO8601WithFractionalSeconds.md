# Handle fractional seconds when encoding/decoding Date in JSON

Extensions to `Date`, `JSONEncoder` and `JSONDecoder` for transforming between ISO 8601-formatted dates and `Date` objects, while preserving fractional seconds.


## Overview

The built-in encoders and decoders do not support fractional seconds. This means that trying to parse dates created by most other languages will fail.

The relevant standards are document here:
- [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html)
- [RFC 3339](https://www.ietf.org/rfc/rfc3339)


## Example for using encoder and decoder

```swift
func parseData(_ data: Data) throws -> MyType {
	let decoder = JSONDecoder()
	decoder.dateDecodingStrategy = .iso8601WithFractionalSeconds
	return try decoder.decode(MyType.self, from: data)
}

func encodeData(_ myType: MyType) throws -> Data {
	let encoder = JSONEncoder()
	encoder.dateEncodingStrategy = .iso8601WithFractionalSeconds
	return try encoder.encode(myType)
}
```


## Example for converting manually

Create a `Date` from a string. The init returns `nil` if the date could not be parsed:

```swift
if let date = Date(iso8601: "2019-03-22T13:58:24.371Z") {
	assert(date.timeIntervalSince1970, 1_553_263_104.371)
}
```

Converting a `Date` to a string
```swift
let date = Date(timeIntervalSince1970: 1_553_263_104.371)
assert(.iso8601, "2019-03-22T13:58:24.371Z")
```

## See Also

- ``FzkExtensions/Foundation/Date/init(iso8601:)``
- ``FzkExtensions/Foundation/Date/iso8601``
- ``FzkExtensions/Foundation/JSONDecoder/DateDecodingStrategy/iso8601WithFractionalSeconds``
- ``FzkExtensions/Foundation/JSONEncoder/DateEncodingStrategy/iso8601WithFractionalSeconds``
