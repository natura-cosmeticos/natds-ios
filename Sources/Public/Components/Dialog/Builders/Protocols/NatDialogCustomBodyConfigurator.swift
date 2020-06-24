public protocol NatDialogCustomBodyConfigurator: NatDialogBuilder {}

extension NatDialogCustomBodyConfigurator {
    public func configure(body: UIView) -> Self {
        viewModel.bodyView = body

        return self
    }
}
