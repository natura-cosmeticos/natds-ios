extension NatDialogController {
    public final class AlertStyleBuilder {

        // MARK: - DialogBuilder

        public let viewModel = ViewModel()

        // MARK: - Public methods

        public func configure(primaryButtonTitle title: String, withAction action: @escaping () -> Void) -> Self {
            let footerView = DialogStyle.FooterView()

            footerView.configure(primaryButton: .init(
                title: title,
                style: .text,
                action: action)
            )

            viewModel.footerView = footerView

            return self
        }

        public func configure(secondaryButtonTitle title: String, withAction action: @escaping () -> Void) -> Self {
            viewModel.footerView?.configure(secondaryButton: .init(
                title: title,
                style: .text,
                action: action)
            )

            return self
        }
    }
}

extension NatDialogController.AlertStyleBuilder: DialogBuilder {}
extension NatDialogController.AlertStyleBuilder: DialogTitleConfigurator {}
extension NatDialogController.AlertStyleBuilder: DialogBodyConfigurator {}
