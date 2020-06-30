public protocol NatDialogCustomBodyConfigurator {}

extension NatDialogCustomBodyConfigurator where Self: NatDialogBuilder {
    public func configure(body: UIView) -> Self {
        viewModel.bodyView = body

        return self
    }
}
