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
	/// else { throw UnwrapError.valueWasNil }
	///
	/// // After
	/// let value = try value.unwrap()
	/// ```
	///
	/// - returns: The unwrapped value.
	/// - throws: If the value is nil.
	func unwrap() throws(UnwrapError) -> Wrapped {
		guard let value = self
		else { throw .valueWasNil }

		return value
	}

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
	/// - parameter orThrow: The error that should be thrown if the value is `nil`.
	/// - returns: The unwrapped value.
	/// - throws: If the value is nil.
	func unwrap<E: Error>(orThrow error: @autoclosure () -> E) throws(E) -> Wrapped {
		guard let value = self
		else { throw error() }

		return value
	}
}
