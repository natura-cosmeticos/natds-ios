public protocol DialogBodyConfigurator: DialogBuilder {}

extension DialogBodyConfigurator {
    public func configure(body: String) -> Self {
        viewModel.bodyView = DialogStyle.createLabelForBody(body: body)

        return self
    }

    public func configure(body: UIView) -> Self {
        viewModel.bodyView = body

        return self
    }
}
