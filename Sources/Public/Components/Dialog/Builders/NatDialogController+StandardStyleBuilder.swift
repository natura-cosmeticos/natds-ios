extension NatDialogController {
    public final class StandardStyleBuilder {

        // MARK: - DialogBuilder

        public let viewModel = ViewModel()

        // MARK: - Public methods

        public func configure(primaryButtonTitle title: String, withAction action: @escaping () -> Void) -> Self {
            let footerView = DialogStyle.FooterView()

            footerView.configure(primaryButton: .init(
                title: title,
                style: .contained,
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

extension NatDialogController.StandardStyleBuilder: DialogBuilder {}
extension NatDialogController.StandardStyleBuilder: DialogTitleConfigurator {}
extension NatDialogController.StandardStyleBuilder: DialogBodyConfigurator {}
