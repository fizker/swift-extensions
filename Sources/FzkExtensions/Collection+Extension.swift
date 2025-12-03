public extension Collection {
	/// Safely returns the element at the given index, or nil if the index is out of bounds.
	///
	/// Example:
	/// ```swift
	/// let array = [1,2,3]
	/// assert(array[safe: -1] == nil)
	/// assert(array[safe: 0] == 1)
	/// assert(array[safe: 1] == 2)
	/// assert(array[safe: 2] == 3)
	/// assert(array[safe: 3] == nil)
	/// ```
	///
	/// - Parameter index: The index of the element to return.
	/// - Returns: The element at the index, or nil if the index is out of bounds.
	subscript(safe index: Index) -> Element? {
		guard index >= startIndex && index < endIndex
		else { return nil }
		return self[index]
	}
}
