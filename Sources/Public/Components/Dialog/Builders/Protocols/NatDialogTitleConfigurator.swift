public protocol NatDialogTitleConfigurator: NatDialogBuilder {}

extension NatDialogTitleConfigurator {
    public func configure(title: String) -> Self {
        viewModel.titleView = DialogStyle.createLabelForTitle(title: title)

        return self
    }
}
