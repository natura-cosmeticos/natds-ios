public protocol NatDialogCustomBodyConfigurable {}

extension NatDialogCustomBodyConfigurable where Self: NatDialogBuilder {
    public func configure(body: UIView) -> Self {
        viewModel.bodyView = body

        return self
    }
}
