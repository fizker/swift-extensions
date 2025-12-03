import Testing
import FzkExtensions

struct StringInterpolationAppendInterpolationIndentedWith {
	@Test(arguments: [
		("foo", "- foo"),
		(
			"""
			foo
			bar
			baz
			""",
			"""
			- foo
			- bar
			- baz
			"""
		),
		(
			"""
			with
			empty

			lines
			""",
			"""
			- with
			- empty

			- lines
			"""
		),
	])
	func stringInput(input: String, expected: String) async throws {
		let actual = "\(input, indentedWith: "- ")"
		#expect(actual == expected)
	}

	@Test
	func nestedInput() async throws {
		let actual = """
		First:
		\(Bar(name: "first bar", foo: Foo(name: "first foo")), indentedWith: "- ")
		Second:
		\(Bar(name: "second bar", foo: Foo(name: "second foo")), indentedWith: "- ")
		"""

		#expect(actual == """
		First:
		- Name: first bar
		- Foo:
		- · Name: first foo
		- · Name repeated: first foo
		Second:
		- Name: second bar
		- Foo:
		- · Name: second foo
		- · Name repeated: second foo
		""")
	}
}

struct Foo: CustomStringConvertible {
	var name: String

	var description: String {
		"""
		Name: \(name)
		Name repeated: \(name)
		"""
	}
}

struct Bar: CustomStringConvertible {
	var name: String
	var foo: Foo

	var description: String {
		"""
		Name: \(name)
		Foo:
		\(foo, indentedWith: "· ")
		"""
	}
}
