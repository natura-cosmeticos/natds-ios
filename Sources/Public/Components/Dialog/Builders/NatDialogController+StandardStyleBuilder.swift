extension NatDialogController {
    /**
        StandardStyleBuilder is one of the styles available for NatDialogController component.

                    Example of usage:
                         let dialog = NatDialogController
                         .standardStyleBuilder
                         .configure(...)
                         .build()

     */
    public final class StandardStyleBuilder {

        // MARK: - NatDialogBuilder

        public let viewModel = ViewModel()

        public var buttonsConfiguration: (
            primary: DialogButtonConfiguration?,
            secondary: DialogButtonConfiguration?
        ) = (nil, nil)

        // MARK: - Public methods

        /// Configures the primary button text and action for the Dialog
        /// - Parameters:
        ///   - title: a String to be displayed as the button title
        ///   - action: the block of code to be executed when the button is tapped
        @discardableResult
        public func configure(primaryButtonTitle title: String, theme newTheme:AvailableTheme = .none, withAction action: @escaping () -> Void) -> Self {
            buttonsConfiguration.primary = .init(
                title: title,
                style: .contained,
                theme: newTheme,
                action: action
            )

            return self
        }

        /// Configures the secondary button text and action for the Dialog
        /// - Parameters:
        ///   - title: a String to be displayed as the button title
        ///   - action: the block of code to be executed when the button is tapped
        @discardableResult
        public func configure(secondaryButtonTitle title: String, theme newTheme:AvailableTheme = .none, withAction action: @escaping () -> Void) -> Self {
            buttonsConfiguration.secondary = .init(
                title: title,
                style: .text,
                theme: newTheme,
                action: action
            )

            return self
        }
    }
}

// MARK: - NatDialogBuilder

extension NatDialogController.StandardStyleBuilder: NatDialogBuilder {}

// MARK: - NatDialogTitleConfigurable

extension NatDialogController.StandardStyleBuilder: NatDialogTitleConfigurable {}

// MARK: - NatDialogBodyConfigurable

extension NatDialogController.StandardStyleBuilder: NatDialogBodyConfigurable {}

// MARK: - NatDialogCustomBodyConfigurable

extension NatDialogController.StandardStyleBuilder: NatDialogCustomBodyConfigurable {}

// MARK: - NatDialogDismissableConfigurable

extension NatDialogController.StandardStyleBuilder: NatDialogDismissableConfigurable {}

// MARK: - NatDialogDividerConfigurable

extension NatDialogController.StandardStyleBuilder: NatDialogDividerConfigurable {}

// MARK: - NatDialogCompletionHandlerConfigurable

extension NatDialogController.StandardStyleBuilder: NatDialogCompletionHandlerConfigurable {}
