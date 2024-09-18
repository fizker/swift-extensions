import Testing
import FzkExtensions

struct ArrayExtensionsTests {
	@Test
	func removingAt__arrayIsImmutable_itemIsWithinBounds__newArrayReturned_newArrayIsMissingRequestedElement() async throws {
		let subject = [1,2,3,4]
		let actual = subject.removing(at: 2)
		#expect(actual == [1,2,4])
		#expect(subject == [1,2,3,4])
	}
}
