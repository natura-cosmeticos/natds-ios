extension NatDialogController {
    public final class AlertStyleBuilder {

        // MARK: - Private properties

        private var titleView: UIView?
        private var bodyView: UIView?
        private var primaryButtonConfiguration: ButtonConfiguration?
        private var secondaryButtonConfiguration: ButtonConfiguration?

        // MARK: - Public methods

//        public func configure(title: String) -> Self {
//            titleView = DialogStyle.createLabelForTitle(title: title)
//
//            return self
//        }

        public func configure(body: String) -> Self {
            bodyView = DialogStyle.createLabelForBody(body: body)

            return self
        }

        public func configure(body: UIView) -> Self {
            bodyView = body

            return self
        }

        public func configure(primaryButtonTitle title: String, withAction action: @escaping () -> Void) -> Self {
            primaryButtonConfiguration = .init(title: title, action: action)

            return self
        }

        public func configure(secondaryButtonTitle title: String, withAction action: @escaping () -> Void) -> Self {
            secondaryButtonConfiguration = .init(title: title, action: action)

            return self
        }

        public func build() -> NatDialogController {
            var views: [UIView] = []

            if let view = titleView {

                views.append(view)
            }

            if let view = bodyView {
                views.append(view)
            }

            if let primaryAction = primaryButtonConfiguration {
                let footerView = DialogAlertStyle.FooterView()
                views.append(footerView)

                footerView.configure(primaryButton: primaryAction)

                if let secondaryAction = secondaryButtonConfiguration {
                    footerView.configure(secondaryButton: secondaryAction)
                }
            }

            return .init(views: views)
        }
    }
}
