public protocol NatDialogDismissableConfigurator {}

extension NatDialogDismissableConfigurator where Self: NatDialogBuilder {
    public func configure(isDismissable: Bool) -> Self {
        viewModel.isDismissable = isDismissable

        return self
    }
}
