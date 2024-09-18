import Testing
import FzkExtensions

private class TestClass {
	var a: Int = 0
}

private struct TestStruct {
	var a: Int = 0
}

struct ConfiguratorOperatorTests {
	@Test
	func operator__passingClass__callsFunction_returnsSameInstance() async throws {
		var wasCalled = false

		let instance = TestClass()
		let actual = instance ~ {
			$0.a = 1
			wasCalled = true
		}

		#expect(instance === actual)
		#expect(wasCalled == true)
		#expect(1 == actual.a)
	}

	@Test
	func operator__passingStruct__callsFunction_returnsUpdatedStruct() async throws {
		var wasCalled = false

		let instance = TestStruct()
		let actual = instance ~ {
			$0.a = 1
			wasCalled = true
		}

		#expect(wasCalled == true)
		#expect(0 == instance.a)
		#expect(1 == actual.a)
	}

	@Test
	func operator__passingStruct_oneAssignmentIsThrowing__entireOperationBecomesThrowing() async throws {
		func riskyValue() throws -> Int { 1 }

		let value = try TestStruct() ~ {
			$0.a = try riskyValue()
		}

		#expect(value.a == 1)
	}
}
