import Testing
import FzkExtensions

struct RandomAccessCollectionExtensionTests {
	@Test
	func subscriptSafe__valueAtIndex0_arrayHasItems__returnsValue() async throws {
		let array = [1,2,3]

		let actual = array[safe: 0]
		#expect(1 == actual)
	}

	@Test
	func subscriptSafe__valueAtLastIndex_valueExists__returnsValue() async throws {
		let array = [1,2,3]

		let actual = array[safe: 2]
		#expect(3 == actual)
	}

	@Test
	func subscriptSafe__valueAtIndex0_arrayIsEmpty__returnsNil() async throws {
		let array: [Int] = []

		let actual = array[safe: 0]
		#expect(actual == nil)
	}

	@Test
	func subscriptSafe__valueBeyondLastIndex__returnsNil() async throws {
		let array = [1,2,3]

		let actual = array[safe: 3]
		#expect(actual == nil)
	}
}
