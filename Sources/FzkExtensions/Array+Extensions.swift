public extension Array {
	/// Removes the element at the specified position and returns the resulting array.
	///
	/// - Parameter index: The position of the element to remove. index must be a valid index of the array.
	/// - Returns: The array after removing the element.
	///
	/// All the elements following the specified position are moved up to close the gap.
	/// ```swift
	/// let measurements: [Double] = [1.1, 1.5, 2.9, 1.2, 1.5, 1.3, 1.2]
	/// let removed = measurements.removing(at: 2)
	/// print(removed)
	/// // Prints "[1.1, 1.5, 1.2, 1.5, 1.3, 1.2]"
	/// ```
	///
	/// Note: This is a non-mutating variant of `Array#remove(at index: Int)`.
	///
	/// Complexity: O(n), where n is the length of the array.
	func removing(at index: Index) -> [Element] {
		var copy = self
		copy.remove(at: index)
		return copy
	}
}
