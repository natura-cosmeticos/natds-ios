/// A protocol to enable the configuration of the `dismissable` property for the Dialog
public protocol NatDialogDismissableConfigurable {}

extension NatDialogDismissableConfigurable where Self: NatDialogBuilder {
    /// Sets if the Dialog is dismissable by tapping outside of it
    /// - Parameter isDismissable: a boolean indicating if the property must be set
    @discardableResult
    public func configure(isDismissable: Bool) -> Self {
        viewModel.isDismissable = isDismissable

        return self
    }
}
