public protocol NatDialogBodyConfigurable {}

extension NatDialogBodyConfigurable where Self: NatDialogBuilder {
    public func configure(body: String) -> Self {
        viewModel.bodyView = DialogStyle.createLabelForBody(body: body)

        return self
    }
}
