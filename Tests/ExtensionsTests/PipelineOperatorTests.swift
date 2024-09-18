import Testing
import FzkExtensions

struct PipelineOperatorTests {
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

	@Test
	func operator__lhsIsInt_rhsAddsOne__returnsCorrectValue() async throws {
		let expected = 2
		let actual = 1 |> addOne

		#expect(expected == actual)
	}

	@Test
	func operator__rhsThrows__rethrowsError() async throws {
		#expect(throws: TestError.errorType1.self) { try 1 |> throwsError }
	}

	@Test
	func operator__lhsIsAsync__callsRHSCorrectly() async throws {
		let actual = await makeAsync(1)
			|> addOne

		#expect(2 == actual)
	}

	@Test
	func operator__rhsIsAsync__returnsCorrectValue() async throws {
		let actual = await 1 |> addOneAsync

		#expect(2 == actual)
	}

	@Test
	func docExample_sync() async throws {
		func increase(value: Int) -> Int { value + 1 }
		#expect(1 |> increase |> increase == 3)
	}

	@Test
	func docExample_async() async throws {
		func increase(value: Int) async -> Int { value + 1 }
		#expect(await 1 |> increase |> increase == 3)
	}
}
