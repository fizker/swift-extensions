import XCTest
import ExtraOperators

private struct TestStruct {
	var a: Int?
}

final class OptionalSetOperatorTests: XCTestCase {
	func test__operator__lhsIsNil__lhsIsUpdatedToRHS() async throws {
		var lhs: Int? = nil

		lhs ??= 1

		XCTAssertEqual(lhs, 1)
	}

	func test__operator__lhsIsNotNil__lhsIsNotUpdated() async throws {
		var lhs: Int? = 2

		lhs ??= 1

		XCTAssertEqual(lhs, 2)
	}

	func test__operator__rootHasNestedOptional_nestedValueIsNil__valueIsUpdated() async throws {
		var root = TestStruct(a: nil)

		root.a ??= 1

		XCTAssertEqual(root.a, 1)
	}

	func test__operator__rootHasNestedOptional_nestedValueIsNotNil__valueIsNotUpdated() async throws {
		var root = TestStruct(a: 2)

		root.a ??= 1

		XCTAssertEqual(root.a, 2)
	}

	func test__operator__rootIsOptional_rootHasNestedOptional_rootIsNil__rootIsStillNil() async throws {
		var root: TestStruct? = nil

		root?.a ??= 1

		XCTAssertNil(root)
		XCTAssertNil(root?.a)
	}

	func test__operator__rootIsOptional_rootHasNestedOptional_rootIsNotNil_valueIsNil__valueIsUpdated() async throws {
		var root: TestStruct? = TestStruct(a: nil)

		root?.a ??= 1

		XCTAssertEqual(root?.a, 1)
	}

	func test__operator__rootIsOptional_rootHasNestedOptional_rootIsNotNil_valueIsNotNil__valueIsNotUpdated() async throws {
		var root: TestStruct? = TestStruct(a: 2)

		root?.a ??= 1

		XCTAssertEqual(root?.a, 2)
	}

	func test__operator__lhsIsNotNil_rhsIsThrowing__entireOperationBecomesThrowing_lhsIsUnmodified() async throws {
		var lhs: Int? = 2

		func riskyValue() throws -> Int { 1 }

		try lhs ??= riskyValue()

		XCTAssertEqual(lhs, 2)
	}

	func test__operator__lhsIsNil_rhsIsThrowing__entireOperationBecomesThrowing_lhsIsUpdated() async throws {
		var lhs: Int? = nil

		func riskyValue() throws -> Int { 1 }

		try lhs ??= riskyValue()

		XCTAssertEqual(lhs, 1)
	}
}
