public protocol NatDialogDismissableConfigurator: NatDialogBuilder {}

extension NatDialogTitleConfigurator {
    public func configure(isDismissable: Bool) -> Self {
        viewModel.isDismissable = isDismissable

        return self
    }
}
