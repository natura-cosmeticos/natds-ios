public protocol NatDialogTitleConfigurable {}

extension NatDialogTitleConfigurable where Self: NatDialogBuilder {
    @discardableResult
    public func configure(title: String) -> Self {
        viewModel.titleView = DialogStyle.createLabelForTitle(title: title)

        return self
    }
}
