extension NatDialogController {
    public final class AlertStyleBuilder {

        // MARK: - NatDialogBuilder

        public let viewModel = ViewModel()

        public var buttonsConfiguration: (
            primary: DialogButtonConfiguration?,
            secondary: DialogButtonConfiguration?
        ) = (primary: nil, secondary: nil)

        // MARK: - Public methods

        public func configure(primaryButtonTitle title: String, withAction action: @escaping () -> Void) -> Self {
            buttonsConfiguration.primary = .init(
                title: title,
                style: .text,
                action: action
            )

            return self
        }

        public func configure(secondaryButtonTitle title: String, withAction action: @escaping () -> Void) -> Self {
            buttonsConfiguration.secondary = .init(
                title: title,
                style: .text,
                action: action
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

// MARK: - NatDialogDismissableConfigurator

extension NatDialogController.AlertStyleBuilder: NatDialogDismissableConfigurator {}
