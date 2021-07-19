public protocol NatDialogDividerConfigurable {}

extension NatDialogDividerConfigurable where Self: NatDialogBuilder {
    /// Sets dividers to the Dialog layout, separating the header and the bottom from the body
    /// - Parameter divider: a boolean indicating if the divider must be set
    @discardableResult
    public func configure(divider: Bool) -> Self {
        if divider {
            viewModel.topDividerView = DialogStyle.createDivider()
            viewModel.bottomDividerView = DialogStyle.createDivider()
        }

        return self
    }
}
