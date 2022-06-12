import XCTest
import ExtraOperators

private class TestClass {
	var a: Int = 0
}

private struct TestStruct {
	var a: Int = 0
}

final class ConfiguratorOperatorTests: XCTestCase {
	func test__operator__passingClass__callsFunction_returnsSameInstance() async throws {
		var wasCalled = false

		let instance = TestClass()
		let actual = instance ~ {
			$0.a = 1
			wasCalled = true
		}

		XCTAssertTrue(instance === actual)
		XCTAssertTrue(wasCalled)
		XCTAssertEqual(1, actual.a)
	}

	func test__operator__passingStruct__callsFunction_returnsUpdatedStruct() async throws {
		var wasCalled = false

		let instance = TestStruct()
		let actual = instance ~ {
			$0.a = 1
			wasCalled = true
		}

		XCTAssertTrue(wasCalled)
		XCTAssertEqual(0, instance.a)
		XCTAssertEqual(1, actual.a)
	}

	func test__operator__passingStruct_oneAssignmentIsThrowing__entireOperationBecomesThrowing() async throws {
		func riskyValue() throws -> Int { 1 }

		let value = try TestStruct() ~ {
			$0.a = try riskyValue()
		}

		XCTAssertEqual(value.a, 1)
	}
}
