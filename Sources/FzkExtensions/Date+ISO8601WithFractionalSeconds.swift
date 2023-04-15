import Foundation

extension Formatter {
	static let iso8601WithFractionalSeconds = ISO8601DateFormatter() ~ {
		$0.formatOptions = [ .withFractionalSeconds, .withInternetDateTime ]
	}
}

public extension Date {
	/// Parses the passed-in value according to the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) and [RFC 3339](https://www.ietf.org/rfc/rfc3339) standards.
	///
	/// It also supports fractional seconds.
	///
	/// - parameter iso6801: The value to parse.
	/// - returns: The parsed `Date`, or `nil` if the input cannot be parsed.
	init?(iso8601: String) {
		guard let d = ISO8601DateFormatter().date(from: iso8601) ?? Formatter.iso8601WithFractionalSeconds.date(from: iso8601)
		else { return nil }
		self = d
	}

	/// Formats the date according to the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) and [RFC 3339](https://www.ietf.org/rfc/rfc3339) standards.
	var iso8601: String {
		if timeIntervalSince1970 == floor(timeIntervalSince1970) {
			return ISO8601DateFormatter().string(from: self)
		} else {
			return Formatter.iso8601WithFractionalSeconds.string(from: self)
		}
	}
}

public extension JSONEncoder.DateEncodingStrategy {
	/// The strategy that formats dates according to the ISO 8601 and RFC 3339 standards, including support for fractional seconds.
	static let iso8601WithFractionalSeconds = custom {
		var container = $1.singleValueContainer()
		try container.encode($0.iso8601)
	}
}

public extension JSONDecoder.DateDecodingStrategy {
	/// The strategy that formats dates according to the ISO 8601 standard, including support for fractional seconds.
	static let iso8601WithFractionalSeconds = custom {
		let container = try $0.singleValueContainer()
		let string = try container.decode(String.self)

		guard let date = Date(iso8601: string)
		else {
			throw DecodingError.dataCorrupted(.init(codingPath: $0.codingPath, debugDescription: "Invalid date"))
		}

		return date
	}
}
