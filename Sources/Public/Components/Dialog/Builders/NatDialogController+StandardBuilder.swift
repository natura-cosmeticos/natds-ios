extension NatDialogController {
    public final class StandardBuilder {

        // MARK: - Private properties

        private var titleView: UIView?
        private var bodyView: UIView?
        private var primaryAction: ButtonConfiguration?
        private var secondaryAction: ButtonConfiguration?

        // MARK: - Public methods

        public func configure(title: String) -> Self {
            let view = TitleView()
            view.set(title: title)
            titleView = view

            return self
        }

        public func configure(body: String) -> Self {
            let view = BodyView()
            view.set(body: body)

            bodyView = view

            return self
        }

        public func configure(body: UIView) -> Self {
            bodyView = body

            return self
        }

        public func configure(primaryTitle title: String, primaryAction action: @escaping () -> Void) -> Self {
            primaryAction = .init(title: title, action: action)

            return self
        }

        public func configure(secondaryTitle title: String, secondaryAction action: @escaping () -> Void) -> Self {
            secondaryAction = .init(title: title, action: action)

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

            if let primaryAction = primaryAction {
                let footerView = FooterView()
                views.append(footerView)

                footerView.configure(primaryButton: primaryAction)

                if let secondaryAction = secondaryAction {
                    footerView.configure(secondaryButton: secondaryAction)
                }
            }

            return .init(views: views)
        }
    }
}
