extension String.StringInterpolation {
	/// Indents each newline-separated line with the given value.
	///
	/// The most simple example:
	/// ```swift
	/// #expect("\("""
	/// foo
	/// bar
	/// """, indentedWith: "- ") == """
	/// - foo
	/// - bar
	/// """)
	/// ```
	///
	/// A more useful example:
	/// ```swift
	/// struct Person: CustomStringConvertible {
	/// 	var name: String
	/// 	var city: String
	///
	/// 	var description: String {
	/// 		"""
	/// 		Name: \(name)
	/// 		City: \(city)
	/// 		"""
	/// 	}
	/// }
	///
	/// #expect("""
	/// Person:
	/// \(person, indentedWith: "- ")
	/// """ == """
	/// User:
	/// - name: Peter Parker
	/// - city: New York
	/// """
	/// ```
	///
	/// It nests automatically:
	///
	/// ```swift
	/// struct Apartment: CustomStringConvertible {
	/// 	var address: String
	/// 	var owner: Person
	///
	/// 	var description: String {
	/// 		"""
	/// 		Address: \(address)
	/// 		\(owner, indentedWith: "- ")
	/// 		"""
	/// 	}
	/// }
	///
	/// #expect("""
	/// Apartments:
	/// \(apartments, indentedWith: "- ")
	/// """ == """
	/// Apartments:
	/// - Address: 410 Chelsea Street, Manhattan
	/// - - name: Peter Parker
	/// - - city: New York
	/// - Address: 20 Ingram Street, Queens
	/// - - name: May Parker
	/// - - city: New York
	/// """
	/// )
	public mutating func appendInterpolation<T>(_ value: T, indentedWith indent: String) {
		let result = "\(value)"
			.split(separator: "\n", omittingEmptySubsequences: false)
			.map { $0.isEmpty ? $0 : indent + $0 }
			.joined(separator: "\n")
		appendLiteral(result)
	}
}
