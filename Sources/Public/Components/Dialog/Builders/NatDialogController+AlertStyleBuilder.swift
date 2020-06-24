extension NatDialogController {
    public final class AlertStyleBuilder {

        // MARK: - NatDialogBuilder

        public let viewModel = ViewModel()

        // MARK: - Public methods

        public func configure(primaryButtonTitle title: String, withAction action: @escaping () -> Void) -> Self {
            let footerView = DialogFooterView()

            footerView.configure(primaryButton:
                .init(
                    title: title,
                    style: .text,
                    action: action
                )
            )

            viewModel.footerView = footerView

            return self
        }

        public func configure(secondaryButtonTitle title: String, withAction action: @escaping () -> Void) -> Self {
            viewModel.footerView?.configure(secondaryButton:
                .init(
                    title: title,
                    style: .text,
                    action: action
                )
            )

            return self
        }
    }
}

// MARK: - NatDialogBuilder

extension NatDialogController.AlertStyleBuilder: NatDialogBuilder {}

// MARK: - NatDialogTitleConfigurator

extension NatDialogController.AlertStyleBuilder: NatDialogTitleConfigurator {}

// MARK: - NatDialogBodyConfigurator

extension NatDialogController.AlertStyleBuilder: NatDialogBodyConfigurator {}
