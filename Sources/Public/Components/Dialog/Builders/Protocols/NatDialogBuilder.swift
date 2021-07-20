public protocol NatDialogBuilder: class {
    var viewModel: NatDialogController.ViewModel { get }
    var buttonsConfiguration: (primary: DialogButtonConfiguration?, secondary: DialogButtonConfiguration?) { get }
}

extension NatDialogBuilder {
    /// The builder function to the Dialog component.
    /// Should be used with other configurable builders to set the Dialog's properties.
    /// - Returns: a Dialog
    public func build() -> NatDialogController {
        if  buttonsConfiguration.primary != nil {
            viewModel.footerView = .init()
            buttonsConfiguration.primary.map { viewModel.footerView?.configure(newButton: $0) }
            buttonsConfiguration.secondary.map { viewModel.footerView?.configure(newButton: $0) }
        }

        return .init(viewModel: viewModel)
    }
}
