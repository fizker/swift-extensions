import Testing
import FzkExtensions

private struct TestStruct {
	var a: Int?
}

struct OptionalCompoundAssignmentOperatorTests {
	@Test
	func operator__lhsIsNil__lhsIsUpdatedToRHS() async throws {
		var lhs: Int? = nil

		lhs ??= 1

		#expect(lhs == 1)
	}

	@Test
	func operator__lhsIsNotNil__lhsIsNotUpdated() async throws {
		var lhs: Int? = 2

		lhs ??= 1

		#expect(lhs == 2)
	}

	@Test
	func operator__rootHasNestedOptional_nestedValueIsNil__valueIsUpdated() async throws {
		var root = TestStruct(a: nil)

		root.a ??= 1

		#expect(root.a == 1)
	}

	@Test
	func operator__rootHasNestedOptional_nestedValueIsNotNil__valueIsNotUpdated() async throws {
		var root = TestStruct(a: 2)

		root.a ??= 1

		#expect(root.a == 2)
	}

	@Test
	func operator__rootIsOptional_rootHasNestedOptional_rootIsNil__rootIsStillNil() async throws {
		var root: TestStruct? = nil

		root?.a ??= 1

		#expect(root == nil)
		#expect(root?.a == nil)
	}

	@Test
	func operator__rootIsOptional_rootHasNestedOptional_rootIsNotNil_valueIsNil__valueIsUpdated() async throws {
		var root: TestStruct? = TestStruct(a: nil)

		root?.a ??= 1

		#expect(root?.a == 1)
	}

	@Test
	func operator__rootIsOptional_rootHasNestedOptional_rootIsNotNil_valueIsNotNil__valueIsNotUpdated() async throws {
		var root: TestStruct? = TestStruct(a: 2)

		root?.a ??= 1

		#expect(root?.a == 2)
	}

	@Test
	func operator__lhsIsNotNil_rhsIsThrowing__entireOperationBecomesThrowing_lhsIsUnmodified() async throws {
		var lhs: Int? = 2

		func riskyValue() throws -> Int { 1 }

		try lhs ??= riskyValue()

		#expect(lhs == 2)
	}

	@Test
	func operator__lhsIsNil_rhsIsThrowing__entireOperationBecomesThrowing_lhsIsUpdated() async throws {
		var lhs: Int? = nil

		func riskyValue() throws -> Int { 1 }

		try lhs ??= riskyValue()

		#expect(lhs == 1)
	}
}
