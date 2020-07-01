public protocol NatDialogCustomBodyConfigurable {}

extension NatDialogCustomBodyConfigurable where Self: NatDialogBuilder {
    @discardableResult
    public func configure(body: UIView) -> Self {
        viewModel.bodyView = body

        return self
    }
}
