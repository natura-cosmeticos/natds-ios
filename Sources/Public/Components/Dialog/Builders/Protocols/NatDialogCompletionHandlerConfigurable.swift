/// A protocol to enable the configuration of a completion handler for the Dialog's dismiss action
public protocol NatDialogCompletionHandlerConfigurable {}

extension NatDialogCompletionHandlerConfigurable where Self: NatDialogBuilder {
    /// Sets a completion handler to the Dialog dismiss action
    /// - Parameter divider: a block of code to be executed when the dialog is dismissed
    @discardableResult
    public func configure(dismissActionHandler: ActionHandler?) -> Self {
        viewModel.dismissCompletionHandler = dismissActionHandler

        return self
    }
}
