public protocol NatDialogBodyConfigurable {}

extension NatDialogBodyConfigurable where Self: NatDialogBuilder {
    @discardableResult
    public func configure(body: String) -> Self {
        viewModel.bodyView = DialogStyle.createLabelForBody(body: body)

        return self
    }
}
