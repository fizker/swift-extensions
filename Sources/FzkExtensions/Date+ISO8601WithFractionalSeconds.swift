import Foundation

extension Formatter {
	static let iso8601WithFractions = ISO8601DateFormatter() ~ {
		$0.formatOptions = [ .withFractionalSeconds, .withInternetDateTime ]
	}
}

public extension Date {
	init?(iso8601: String) {
		guard let d = Formatter.iso8601WithFractions.date(from: iso8601)
		else { return nil }
		self = d
	}

	var iso8601: String {
		return Formatter.iso8601WithFractions.string(from: self)
	}
}
