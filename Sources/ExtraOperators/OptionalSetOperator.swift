infix operator ??=: AssignmentPrecedence

/// Assigns the lhs if it is nil, otherwise it is unmodified.
///
/// Example:
/// ```swift
/// // Given the class Foo
/// class Foo {
///     var bar: Int?
/// }
///
/// // The following code
/// func ensureValue(foo: Foo) -> Foo {
///     foo.bar = foo.bar ?? 1
///     return foo
/// }
/// // can be rewritten to
/// func ensureValue(foo: Foo) -> Foo {
///     foo.bar ??= 1
///     return foo
/// }
/// ```
///
/// - Parameter lhs: The property to modify. The property must be modifiable.
/// - Parameter rhs: The value to assign if the lhs is nil. The rhs value will not be read unless the lhs value is nil. This means that expensive operations are only paid for if necessary.
public func ??=<T>(lhs: inout T?, rhs: @autoclosure () -> T) {
	guard lhs == nil
	else { return }
	lhs = rhs()
}
