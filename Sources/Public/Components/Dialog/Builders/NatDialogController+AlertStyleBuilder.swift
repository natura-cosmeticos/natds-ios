extension NatDialogController {
    /**
         AlertStyleBuilder is one of the styles available for NatDialogController componente.

                    Example of usage:
                         let dialog = NatDialogController
                         .standardStyleBuilder
                         .configure(...)
                         .build()

     */
    public final class AlertStyleBuilder {

        // MARK: - NatDialogBuilder

        public let viewModel = ViewModel()

        public var buttonsConfiguration: (
            primary: DialogButtonConfiguration?,
            secondary: DialogButtonConfiguration?
        ) = (primary: nil, secondary: nil)

        // MARK: - Public methods

        @discardableResult
        public func configure(primaryButtonTitle title: String, withAction action: @escaping () -> Void) -> Self {
            buttonsConfiguration.primary = .init(
                title: title,
                style: .text,
                action: action
            )

            return self
        }

        @discardableResult
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

// MARK: - NatDialogTitleConfigurable

extension NatDialogController.AlertStyleBuilder: NatDialogTitleConfigurable {}

// MARK: - NatDialogBodyConfigurable

extension NatDialogController.AlertStyleBuilder: NatDialogBodyConfigurable {}

// MARK: - NatDialogDismissableConfigurable

extension NatDialogController.AlertStyleBuilder: NatDialogDismissableConfigurable {}
