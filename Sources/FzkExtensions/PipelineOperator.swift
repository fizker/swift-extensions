infix operator |>: AdditionPrecedence

/// Executes `rhs` with `lhs` and returns the result.
///
/// This is a convenience operator. It allows to pass a value through functions without wrapping the value in parantheses.
///
/// ```swift
/// // given
/// func increase(value: Int) -> Int { value + 1 }
///
/// // Instead of
/// increase(increase(1)) == 3
///
/// // we can now do
/// 1 |> increase |> increase == 3
/// ```
public func |><T, U>(lhs: T, rhs: (T) throws -> U) rethrows -> U {
	return try rhs(lhs)
}

/// Executes `rhs` with `lhs` and returns the result.
///
/// This is a convenience operator. It allows to pass a value through functions without wrapping the value in parantheses.
///
/// ```swift
/// // given
/// func increase(value: Int) async -> Int { value + 1 }
///
/// // Instead of
/// await increase(increase(1)) == 3
///
/// // we can now do
/// await 1 |> increase |> increase == 3
/// ```
@available(iOS 13.0.0, *)
@available(macCatalyst 13.0.0, *)
@available(macOS 10.15.0, *)
@available(tvOS 13.0.0, *)
@available(watchOS 6.0.0, *)
public func |><T, U>(lhs: T, rhs: (T) async throws -> U) async rethrows -> U {
	return try await rhs(lhs)
}
