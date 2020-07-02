public protocol NatDialogDismissableConfigurable {}

extension NatDialogDismissableConfigurable where Self: NatDialogBuilder {
    @discardableResult
    public func configure(isDismissable: Bool) -> Self {
        viewModel.isDismissable = isDismissable

        return self
    }
}
