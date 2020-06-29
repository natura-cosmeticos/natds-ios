public protocol NatDialogBodyConfigurator: NatDialogBuilder {}

extension NatDialogBodyConfigurator {
    public func configure(body: String) -> Self {
        viewModel.bodyView = DialogStyle.createLabelForBody(body: body)

        return self
    }
}
