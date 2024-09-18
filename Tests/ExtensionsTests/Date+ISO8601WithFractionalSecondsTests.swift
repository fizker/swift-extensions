import Testing
import Foundation
import FzkExtensions

private struct TestData {
	var iso8601: String
	var timeInterval: TimeInterval

	var json: String {
		"""
		"\(iso8601)"
		"""
	}
}

struct DateISO8601WithFractionalSecondsTests {
	private let withFractionalSeconds = TestData(iso8601: "2019-03-22T13:58:24.371Z", timeInterval: 1_553_263_104.371)
	private let withoutFractionalSeconds = TestData(iso8601: "2019-03-22T13:58:24Z", timeInterval: 1_553_263_104)

	@Test
	func dateInitWithString__valueHasFractionalSeconds__decodesCorrectly() async throws {
		let actual = Date(iso8601: withFractionalSeconds.iso8601)
		let expected = Date(timeIntervalSince1970: withFractionalSeconds.timeInterval)
		#expect(expected == actual)
	}

	@Test
	func iso8601__valueHasFractionalSeconds__encodesCorrectly() async throws {
		let value = Date(timeIntervalSince1970: withFractionalSeconds.timeInterval)
		let expected = withFractionalSeconds.iso8601
		let actual = value.iso8601
		#expect(expected == actual)
	}

	@Test
	func jsonDecoder__valueHasFractionalSeconds__decodesCorrectly() async throws {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .iso8601WithFractionalSeconds
		let data = withFractionalSeconds.json.data(using: .utf8)!
		let actual = try decoder.decode(Date.self, from: data)
		let expected = Date(timeIntervalSince1970: withFractionalSeconds.timeInterval)
		#expect(expected == actual)
	}

	@Test
	func jsonEncoder__valueHasFractionalSeconds__encodesCorrectly() async throws {
		let encoder = JSONEncoder()
		encoder.dateEncodingStrategy = .iso8601WithFractionalSeconds
		let data = try encoder.encode(Date(timeIntervalSince1970: withFractionalSeconds.timeInterval))
		let actual = String(data: data, encoding: .utf8)
		let expected = withFractionalSeconds.json

		#expect(expected == actual)
	}

	@Test
	func dateInitWithString__valueDoesNotHaveFractionalSeconds__decodesCorrectly() async throws {
		let actual = Date(iso8601: withoutFractionalSeconds.iso8601)
		let expected = Date(timeIntervalSince1970: withoutFractionalSeconds.timeInterval)
		#expect(expected == actual)
	}

	@Test
	func iso8601__valueDoesNotHaveFractionalSeconds__encodesCorrectly() async throws {
		let value = Date(timeIntervalSince1970: withoutFractionalSeconds.timeInterval)
		let expected = withoutFractionalSeconds.iso8601
		let actual = value.iso8601
		#expect(expected == actual)
	}

	@Test
	func jsonDecoder__valueDoesNotHaveFractionalSeconds__decodesCorrectly() async throws {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .iso8601WithFractionalSeconds
		let data = withoutFractionalSeconds.json.data(using: .utf8)!
		let actual = try decoder.decode(Date.self, from: data)
		let expected = Date(timeIntervalSince1970: withoutFractionalSeconds.timeInterval)
		#expect(expected == actual)
	}

	@Test
	func jsonEncoder__valueDoesNotHaveFractionalSeconds__encodesCorrectly() async throws {
		let encoder = JSONEncoder()
		encoder.dateEncodingStrategy = .iso8601WithFractionalSeconds
		let data = try encoder.encode(Date(timeIntervalSince1970: withoutFractionalSeconds.timeInterval))
		let actual = String(data: data, encoding: .utf8)
		let expected = withoutFractionalSeconds.json

		#expect(expected == actual)
	}
}
