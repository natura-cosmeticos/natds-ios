public protocol DialogTitleConfigurator: DialogBuilder {}

extension DialogTitleConfigurator {
    public func configure(title: String) -> Self {
        viewModel.titleView = DialogStyle.createLabelForTitle(title: title)

        return self
    }
}
