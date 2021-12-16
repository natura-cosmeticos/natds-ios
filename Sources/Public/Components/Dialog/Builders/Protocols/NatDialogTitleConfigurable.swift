/// A protocol to enable the configuration of a title for the Dialog
public protocol NatDialogTitleConfigurable {}

extension NatDialogTitleConfigurable where Self: NatDialogBuilder {
    /// Sets the title for the Dialog header
    /// - Parameter title: a String to be displayed as the Dialog title
    @discardableResult
    public func configure(title: String) -> Self {
        viewModel.titleView = DialogStyle.createHeaderView(title: title)

        return self
    }
}
