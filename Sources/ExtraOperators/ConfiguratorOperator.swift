infix operator ~: AdditionPrecedence

/// Configurator operator allowing the left-hand side to be modified by the function passed to the right-hand side.
///
/// The two primary use-cases are to create and configure an object without creating a local variable, or to modify a struct without having it be mutable.
///
/// ### Configuration example
/// ```swift
/// let view = UIView()
/// let gr = UITapGestureRecognizer()
/// gr.numberOfTapsRequired = 2
/// gr.modifierFlags = [ .command ]
/// view.addGestureRecognizer(gr)
/// ```
/// becomes
/// ```swift
/// let view = UIView()
/// view.addGestureRecognizer(UITapGestureRecognizer() ~ {
///     $0.numberOfTapsRequired = 2
///     $0.modifierFlags = [ .command ]
/// })
/// ```
///
/// ### Immutable example
/// ```swift
/// func doubleHeight(rect: CGRect) -> CGRect {
///     var rect = rect
///     rect.size.height *= 2
///     return rect
/// }
/// ```
/// becomes
/// ```swift
/// func doubleHeight(rect: CGRect) -> CGRect {
///     rect ~ {
///         $0.size.height *= 2
///     }
/// }
/// ```
///
/// - Parameter subject: The object to modify.
/// - Parameter fn: The function that will be called to modify the subject. The subject will always be modifiable in this function.
/// - Returns: A modified version. If the subject is a struct, a copy will be returned. If the subject is a class, it will be the same instance as was passed in.
public func ~<T>(_ subject: T, _ fn: (inout T) -> Void) -> T {
	var s = subject
	fn(&s)
	return s
}
