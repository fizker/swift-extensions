extension Sequence {
	/// Returns the elements of the sequence, sorted by the given KeyPath.
	///
	/// You can sort any sequence of elements where a KeyPath returns a value
	/// that conform to the `Comparable` protocol by calling this method.
	/// Elements are sorted in ascending order.
	///
	/// Here's an example of sorting a list of students by their name. Strings in Swift
	/// conform to the `Comparable` protocol, so the names are sorted in
	/// ascending order according to the less-than operator (`<`).
	///
	///     struct Student {
	///         var name: String
	///     }
	///     let students: [Student] = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"].map(Student.init(name:))
	///     let sortedStudents = students.sorted(by: \.name)
	///     print(sortedStudents.map(\.name))
	///     // Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
	///
	/// To sort the elements of your sequence in descending order, pass the
	/// greater-than operator (`>`) to the `sorted(by:,using:)` method.
	///
	///     let descendingStudents = students.sorted(by: \.name, using: >)
	///     print(descendingStudents.map(\.name)
	///     // Prints "["Peter", "Kweku", "Kofi", "Akosua", "Abena"]"
	///
	/// The sorting algorithm is guaranteed to be stable. A stable sort
	/// preserves the relative order of elements that compare as equal.
	///
	/// - parameter keyPath: The KeyPath to the value that the list should be sorted by.
	/// - Returns: A sorted array of the sequence's elements.
	///
	/// - Complexity: O(*n* log *n*), where *n* is the length of the sequence.
	public func sorted(by keyPath: KeyPath<Element, some Comparable>) -> [Element] {
		sorted(by: keyPath, using: <)
	}

	/// Returns the elements of the sequence, sorted by the given KeyPath using the given comparator function.
	///
	/// You can sort any sequence of elements where a KeyPath returns a value
	/// that conform to the `Comparable` protocol by calling this method.
	/// Elements are sorted according to the given comparator function..
	///
	/// Here's an example of sorting a list of students by their name. Strings in Swift
	/// conform to the `Comparable` protocol, so the names are sorted in
	/// ascending order according to the less-than operator (`<`).
	///
	///     struct Student {
	///         var name: String
	///     }
	///     let students: [Student] = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"].map(Student.init(name:))
	///     let sortedStudents = students.sorted(by: \.name, using: <)
	///     print(sortedStudents.map(\.name))
	///     // Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
	///
	/// To sort the elements of your sequence in descending order, pass the
	/// greater-than operator (`>`) instead.
	///
	///     let descendingStudents = students.sorted(by: \.name, using: >)
	///     print(descendingStudents.map(\.name)
	///     // Prints "["Peter", "Kweku", "Kofi", "Akosua", "Abena"]"
	///
	/// The sorting algorithm is guaranteed to be stable. A stable sort
	/// preserves the relative order of elements that compare as equal.
	///
	/// - parameter keyPath: The KeyPath to the value that the list should be sorted by.
	/// - parameter comparator: A predicate that returns `true` if its
	///   first argument should be ordered before its second argument;
	///   otherwise, `false`
	/// - Returns: A sorted array of the sequence's elements.
	///
	/// - Complexity: O(*n* log *n*), where *n* is the length of the sequence.
	public func sorted<SortType: Comparable>(by keyPath: KeyPath<Element, SortType>, using comparator: (SortType, SortType) throws -> Bool) rethrows -> [Element] {
		try sorted { try comparator($0[keyPath: keyPath], $1[keyPath: keyPath]) }
	}
}
