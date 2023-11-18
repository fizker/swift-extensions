import XCTest
import FzkExtensions

enum CustomError: Error {
	case customError
}

final class UnwrapOptionalTests: XCTestCase {
	let someValue: Int? = 1
	let nilValue: Int? = nil

	func test__valueIsNotNil_noExceptionGiven__returnsValue() async throws {
		XCTAssertEqual(try someValue.unwrap(), 1)
	}

	func test__valueIsNotNil_customExceptionGiven__returnsValue() async throws {
		XCTAssertEqual(try someValue.unwrap(orThrow: CustomError.customError), 1)
	}

	func test__valueIsNil_noExceptionGiven__throws() async throws {
		XCTAssertThrowsError(try nilValue.unwrap())
	}

	func test__valueIsNil_customExceptionGiven__throwsGivenError() async throws {
		XCTAssertThrowsError(try nilValue.unwrap(orThrow: CustomError.customError)) {
			XCTAssertEqual($0 as? CustomError, CustomError.customError)
		}
	}
}
