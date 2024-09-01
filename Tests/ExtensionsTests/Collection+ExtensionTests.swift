import XCTest
import FzkExtensions

final class RandomAccessCollectionExtensionTests: XCTestCase {
	func test__subscriptSafe__valueAtIndex0_arrayHasItems__returnsValue() async throws {
		let array = [1,2,3]

		let actual = array[safe: 0]
		XCTAssertEqual(1, actual)
	}

	func test__subscriptSafe__valueAtLastIndex_valueExists__returnsValue() async throws {
		let array = [1,2,3]

		let actual = array[safe: 2]
		XCTAssertEqual(3, actual)
	}

	func test__subscriptSafe__valueAtIndex0_arrayIsEmpty__returnsNil() async throws {
		let array: [Int] = []

		let actual = array[safe: 0]
		XCTAssertNil(actual)
	}

	func test__subscriptSafe__valueBeyondLastIndex__returnsNil() async throws {
		let array = [1,2,3]

		let actual = array[safe: 3]
		XCTAssertNil(actual)
	}
}
