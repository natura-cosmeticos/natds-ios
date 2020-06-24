extension NatDialogController {
    public final class StandardStyleBuilder {

        // MARK: - NatDialogBuilder

        public let viewModel = ViewModel()

        // MARK: - Public methods

        public func configure(primaryButtonTitle title: String, withAction action: @escaping () -> Void) -> Self {
            let footerView = DialogFooterView()

            footerView.configure(primaryButton:
                .init(
                    title: title,
                    style: .contained,
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

extension NatDialogController.StandardStyleBuilder: NatDialogBuilder {}

// MARK: - NatDialogTitleConfigurator

extension NatDialogController.StandardStyleBuilder: NatDialogTitleConfigurator {}

// MARK: - NatDialogBodyConfigurator

extension NatDialogController.StandardStyleBuilder: NatDialogBodyConfigurator {}

// MARK: - NatDialogCustomBodyConfigurator

extension NatDialogController.StandardStyleBuilder: NatDialogCustomBodyConfigurator {}
