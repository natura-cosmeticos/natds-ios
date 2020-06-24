public protocol NatDialogBuilder {
    var viewModel: NatDialogController.ViewModel { get }
}

extension NatDialogBuilder {
    public func build() -> NatDialogController {
        return .init(viewModel: viewModel)
    }
}
