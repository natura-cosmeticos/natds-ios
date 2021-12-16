/// A protocol to enable the configuration of a text for the Dialog's body
public protocol NatDialogBodyConfigurable {}

extension NatDialogBodyConfigurable where Self: NatDialogBuilder {
    /// Sets the text for the Dialog body
    /// - Parameter body: a String to be displayed as the Dialog body text
    @discardableResult
    public func configure(body: String) -> Self {
        viewModel.bodyView = DialogStyle.createBodyView(body: body)

        return self
    }
}
