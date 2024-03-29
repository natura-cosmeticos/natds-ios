/// A protocol to enable the configuration of a custom view as the Dialog's body
public protocol NatDialogCustomBodyConfigurable {}

extension NatDialogCustomBodyConfigurable where Self: NatDialogBuilder {
    /// Sets the custom view to the Dialog body
    /// - Parameter body: an `UIView` to be displayed inside the Dialog
    @discardableResult
    public func configure(body: UIView) -> Self {
        viewModel.bodyView = body

        return self
    }
}
