import XCTest
import FzkExtensions

final class ArrayExtensionsTests: XCTestCase {
	func test__removingAt__arrayIsImmutable_itemIsWithinBounds__newArrayReturned_newArrayIsMissingRequestedElement() async throws {
		let subject = [1,2,3,4]
		let actual = subject.removing(at: 2)
		XCTAssertEqual(actual, [1,2,4])
		XCTAssertEqual(subject, [1,2,3,4])
	}
}
