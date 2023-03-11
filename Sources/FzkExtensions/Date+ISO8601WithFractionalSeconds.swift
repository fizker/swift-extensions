import Foundation

extension Formatter {
	static let iso8601WithFractionalSeconds = ISO8601DateFormatter() ~ {
		$0.formatOptions = [ .withFractionalSeconds, .withInternetDateTime ]
	}
}

public extension Date {
	init?(iso8601: String) {
		guard let d = Formatter.iso8601WithFractionalSeconds.date(from: iso8601)
		else { return nil }
		self = d
	}

	var iso8601: String {
		return Formatter.iso8601WithFractionalSeconds.string(from: self)
	}
}

public extension JSONEncoder.DateEncodingStrategy {
	static let iso8601WithFractionalSeconds = custom {
		var container = $1.singleValueContainer()
		try container.encode($0.iso8601)
	}
}

public extension JSONDecoder.DateDecodingStrategy {
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
