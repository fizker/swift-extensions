import Testing
import FzkExtensions

struct UnwrapOptionalTests {
	enum CustomError: Error {
		case customError
	}

	let someValue: Int? = 1
	let nilValue: Int? = nil

	@Test
	func valueIsNotNil_noExceptionGiven__returnsValue() async throws {
		#expect(try someValue.unwrap() == 1)
	}

	@Test
	func valueIsNotNil_customExceptionGiven__returnsValue() async throws {
		#expect(try someValue.unwrap(orThrow: CustomError.customError) == 1)
	}

	@Test
	func valueIsNil_noExceptionGiven__throws() async throws {
		#expect(throws: (any Error).self) { try nilValue.unwrap() }
	}

	@Test
	func valueIsNil_customExceptionGiven__throwsGivenError() async throws {
		#expect(throws: CustomError.customError.self) { try nilValue.unwrap(orThrow: CustomError.customError) }
	}
}
