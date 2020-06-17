extension NatDialogController {
    public final class StandardStyleBuilder {

        // MARK: - Private properties

        private var titleView: UIView?
        private var bodyView: UIView?
        private var primaryButtonConfiguraton: ButtonConfiguration?
        private var secondaryButtonConfiguraton: ButtonConfiguration?

        // MARK: - Public methods

        public func configure(title: String) -> Self {
            let view = DialogStandardStyle.TitleView()
            view.configure(title: title)
            titleView = view

            return self
        }

        public func configure(body: String) -> Self {
            let view = DialogStandardStyle.BodyView()
            view.configure(body: body)

            bodyView = view

            return self
        }

        public func configure(body: UIView) -> Self {
            bodyView = body

            return self
        }

        public func configure(primaryTitle title: String, primaryAction action: @escaping () -> Void) -> Self {
            primaryButtonConfiguraton = .init(title: title, action: action)

            return self
        }

        public func configure(secondaryTitle title: String, secondaryAction action: @escaping () -> Void) -> Self {
            secondaryButtonConfiguraton = .init(title: title, action: action)

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

            if let primaryAction = primaryButtonConfiguraton {
                let footerView = DialogStandardStyle.FooterView()
                views.append(footerView)

                footerView.configure(primaryButton: primaryAction)

                if let secondaryAction = secondaryButtonConfiguraton {
                    footerView.configure(secondaryButton: secondaryAction)
                }
            }

            return .init(views: views)
        }
    }
}
