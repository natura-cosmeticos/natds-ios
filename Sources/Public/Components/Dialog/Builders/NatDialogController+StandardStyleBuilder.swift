extension NatDialogController {
    public final class StandardStyleBuilder {

        // MARK: - NatDialogBuilder

        public let viewModel = ViewModel()
        public var buttonsConfiguration: (
            primary: DialogButtonConfiguration?,
            secondary: DialogButtonConfiguration?
        ) = (nil, nil)

        // MARK: - Public methods

        public func configure(primaryButtonTitle title: String, withAction action: @escaping () -> Void) -> Self {
            buttonsConfiguration.primary = .init(
                title: title,
                style: .contained,
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

extension NatDialogController.StandardStyleBuilder: NatDialogBuilder {}

// MARK: - NatDialogTitleConfigurator

extension NatDialogController.StandardStyleBuilder: NatDialogTitleConfigurator {}

// MARK: - NatDialogBodyConfigurator

extension NatDialogController.StandardStyleBuilder: NatDialogBodyConfigurator {}

// MARK: - NatDialogCustomBodyConfigurator

extension NatDialogController.StandardStyleBuilder: NatDialogCustomBodyConfigurator {}
