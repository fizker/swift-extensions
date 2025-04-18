import Testing
import FzkExtensions

struct SequenceSortedByKeyPathTests {
	struct Foo: Equatable {
		var bar: Int
	}

	struct Bar: Equatable {
		var foo: Foo
	}

	@Test
	func directionIsImplicit__subjectHasIntKeyPath__sortedAscending() async throws {
		let subjects = [
			Foo(bar: 1),
			Foo(bar: 5),
			Foo(bar: 2),
			Foo(bar: 4),
			Foo(bar: 3),
			Foo(bar: 6),
			Foo(bar: 9),
			Foo(bar: 8),
		]

		#expect(subjects.sorted { $0.bar < $1.bar } == subjects.sorted(by: \.bar))
	}

	@Test
	func directionIsImplicit__subjectHasNestedStruct__sortedAscending() async throws {
		let subjects = [
			Bar(foo: Foo(bar: 1)),
			Bar(foo: Foo(bar: 5)),
			Bar(foo: Foo(bar: 2)),
			Bar(foo: Foo(bar: 4)),
			Bar(foo: Foo(bar: 3)),
			Bar(foo: Foo(bar: 6)),
			Bar(foo: Foo(bar: 9)),
			Bar(foo: Foo(bar: 8)),
		]

		#expect(subjects.sorted { $0.foo.bar < $1.foo.bar } == subjects.sorted(by: \.foo.bar))
	}

	@Test
	func directionIsExplicit__asc_subjectHasNestedStruct__sortedCorrectly() async throws {
		let subjects = [
			Bar(foo: Foo(bar: 1)),
			Bar(foo: Foo(bar: 5)),
			Bar(foo: Foo(bar: 2)),
			Bar(foo: Foo(bar: 4)),
			Bar(foo: Foo(bar: 3)),
			Bar(foo: Foo(bar: 6)),
			Bar(foo: Foo(bar: 9)),
			Bar(foo: Foo(bar: 8)),
		]

		#expect(subjects.sorted { $0.foo.bar < $1.foo.bar } == subjects.sorted(by: \.foo.bar, using: <))
	}

	@Test
	func directionIsExplicit__desc_subjectHasNestedStruct__sortedCorrectly() async throws {
		let subjects = [
			Bar(foo: Foo(bar: 1)),
			Bar(foo: Foo(bar: 5)),
			Bar(foo: Foo(bar: 2)),
			Bar(foo: Foo(bar: 4)),
			Bar(foo: Foo(bar: 3)),
			Bar(foo: Foo(bar: 6)),
			Bar(foo: Foo(bar: 9)),
			Bar(foo: Foo(bar: 8)),
		]

		#expect(subjects.sorted { $0.foo.bar > $1.foo.bar } == subjects.sorted(by: \.foo.bar, using: >))
	}

	@Test
	func sortedBy__doccExample() async throws {
		struct Student {
			var name: String
		}
		let students: [Student] = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"].map(Student.init(name:))
		let sortedStudents = students.sorted(by: \.name)
		print(sortedStudents.map(\.name))
		// Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
	}
}
