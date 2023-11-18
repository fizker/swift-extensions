public extension RangeReplaceableCollection {
	/// Removes the element at the specified position and returns the resulting range.
	///
	/// - Parameter index: The position of the element to remove. index must be a valid index of the range.
	/// - Returns: The range after removing the element.
	///
	/// All the elements following the specified position are moved up to close the gap.
	/// ```swift
	/// let measurements: [Double] = [1.1, 1.5, 2.9, 1.2, 1.5, 1.3, 1.2]
	/// let removed = measurements.removing(at: 2)
	/// print(removed)
	/// // Prints "[1.1, 1.5, 1.2, 1.5, 1.3, 1.2]"
	/// ```
	///
	/// Note: This is a non-mutating variant of `RangeReplaceableCollection#remove(at index: Int)`.
	///
	/// Complexity: O(n), where n is the length of the range.
	func removing(at index: Index) -> Self {
		var copy = self
		copy.remove(at: index)
		return copy
	}
}
