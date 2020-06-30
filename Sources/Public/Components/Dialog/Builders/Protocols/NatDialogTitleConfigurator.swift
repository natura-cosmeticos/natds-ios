public protocol NatDialogTitleConfigurator {}

extension NatDialogTitleConfigurator where Self: NatDialogBuilder {
    public func configure(title: String) -> Self {
        viewModel.titleView = DialogStyle.createLabelForTitle(title: title)

        return self
    }
}
