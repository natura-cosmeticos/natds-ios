public protocol DialogBuilder {
    var viewModel: NatDialogController.ViewModel { get }
}

extension DialogBuilder {
    public func build() -> NatDialogController {
        return .init(viewModel: viewModel)
    }
}
