public protocol NatDialogDividerConfigurable {}

extension NatDialogDividerConfigurable where Self: NatDialogBuilder {
    @discardableResult
    public func configure(divider: Bool) -> Self {
        if divider {
            viewModel.topDividerView = DialogStyle.createDivider()
            viewModel.bottomDividerView = DialogStyle.createDivider()
        }

        return self
    }
}
