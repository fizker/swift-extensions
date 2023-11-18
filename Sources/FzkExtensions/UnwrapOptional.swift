public enum UnwrapError: Error, CustomStringConvertible {
	case valueWasNil

	public var description: String {
		switch self {
		case .valueWasNil: "value was nil"
		}
	}
}

public extension Optional {
	/// Unwraps the `Optional`, throwing if the value cannot be unwrapped.
	///
	/// This allows for a convenient alternative to `guard let else throw` constructs:
	///
	/// ```swift
	/// // Before
	/// guard let value
	/// else { throw CustomError.valueWasNil }
	///
	/// // After
	/// let value = try value.unwrap(orThrow: CustomError.valueWasNil)
	/// ```
	///
	/// The custom error is optional, if the default ``UnwrapError`` is acceptable:
	///
	/// ```swift
	/// let value = try value.unwrap()
	/// ```
	///
	/// - parameter orThrow: The error that should be thrown if the value is `nil`.
	/// - returns: The unwrapped value.
	/// - throws: If the value is nil.
	func unwrap(orThrow error: @autoclosure () -> Error = UnwrapError.valueWasNil) throws -> Wrapped {
		guard let value = self
		else { throw error() }

		return value
	}
}
