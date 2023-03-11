import XCTest
import FzkExtensions

final class DateISO8601WithFractionalSecondsTests: XCTestCase {
	let iso8601 = "2019-03-22T13:58:24.371Z"
	let timeInterval: TimeInterval = 1_553_263_104.371

	func test__dateInitWithString__valueHasFractionalSeconds__decodesCorrectly() async throws {
		let actual = Date(iso8601: iso8601)
		let expected = Date(timeIntervalSince1970: timeInterval)
		XCTAssertEqual(expected, actual)
	}

	func test__iso8601__valueHasFractionalSeconds__encodesCorrectly() async throws {
		let value = Date(timeIntervalSince1970: timeInterval)
		let expected = iso8601
		let actual = value.iso8601
		XCTAssertEqual(expected, actual)
	}
}
