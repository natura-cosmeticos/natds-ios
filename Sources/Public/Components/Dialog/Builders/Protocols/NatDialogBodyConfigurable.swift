public protocol NatDialogBodyConfigurable {}

extension NatDialogBodyConfigurable where Self: NatDialogBuilder {
    @discardableResult
    public func configure(body: String) -> Self {
        viewModel.bodyView = DialogStyle.createBodyView(body: body)

        return self
    }
}

public protocol NatDialogDividerConfigurable {}

extension NatDialogDividerConfigurable where Self: NatDialogBuilder {
    @discardableResult
    public func configure(divider: Bool) -> Self {
        viewModel.topDividerView = DialogStyle.createDivider()
        viewModel.bottomDividerView = DialogStyle.createDivider()

        return self
    }
}
