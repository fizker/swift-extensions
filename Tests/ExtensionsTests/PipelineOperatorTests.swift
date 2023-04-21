import XCTest
import FzkExtensions

final class PipelineOperatorTests: XCTestCase {
	enum TestError: Error {
		case errorType1
		case errorType2
	}

	func addOne(_ value: Int) -> Int { value + 1 }
	func throwsError<T>(_ value: T) throws -> T {
		throw TestError.errorType1
	}
	func makeAsync<T>(_ value: T) async -> T {
		return value
	}
	func addOneAsync(_ value: Int) async -> Int {
		return value + 1
	}

	func test__operator__lhsIsInt_rhsAddsOne__returnsCorrectValue() async throws {
		let expected = 2
		let actual = 1 |> addOne

		XCTAssertEqual(expected, actual)
	}

	func test__operator__rhsThrows__rethrowsError() async throws {
		XCTAssertThrowsError(try 1 |> throwsError) {
			let e = $0 as? TestError
			XCTAssertEqual(e, TestError.errorType1)
		}
	}

	func test__operator__lhsIsAsync__callsRHSCorrectly() async throws {
		let actual = await makeAsync(1)
			|> addOne

		XCTAssertEqual(2, actual)
	}

	func test__operator__rhsIsAsync__returnsCorrectValue() async throws {
		let actual = await 1 |> addOneAsync

		XCTAssertEqual(2, actual)
	}
}
