extension NatDialogController {
    public final class StandardStyleBuilder {

        // MARK: - Private properties

        private var titleView: UIView?
        private var bodyView: UIView?
        private var primaryButtonConfiguration: ButtonConfiguration?
        private var secondaryButtonConfiguration: ButtonConfiguration?

        // MARK: - Public methods

        public func configure(title: String) -> Self {
            titleView = DialogStyle.createLabelForTitle(title: title)

            return self
        }

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
                let footerView = DialogStandardStyle.FooterView()
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

extension NatDialogController {
    public final class AlertdStyleBuilder {

        // MARK: - Private properties

        private var titleView: UIView?
        private var bodyView: UIView?
        private var primaryButtonConfiguration: ButtonConfiguration?
        private var secondaryButtonConfiguration: ButtonConfiguration?

        // MARK: - Public methods

        public func configure(title: String) -> Self {
//            let view = DialogStyle.TitleView()
//            view.configure(title: title)
//            titleView = view

            func createTextForTitle(text: String, withColor color: UIColor) -> NSAttributedString {
                        let attributedString = NSMutableAttributedString(string: text)
                        attributedString.apply(foregroundColor: color)

                        let value = getTheme().font.letterSpacings.heading6
                        attributedString.apply(kernValue: value)

                        return attributedString
                    }

            let label = UILabel()
                label.font = NatFonts.font(ofSize: .heading6, withWeight: .medium)
                label.translatesAutoresizingMaskIntoConstraints = false

            label.attributedText = createTextForTitle(text: title, withColor: getTheme().colors.highEmphasis)

            titleView = label

            return self
        }

        public func configure(body: String) -> Self {
//            let view = DialogStyle.BodyView()
//            view.configure(body: body)
//
//            bodyView = view

            func createTextForTitle(text: String, withColor color: UIColor) -> NSAttributedString {
                let attributedString = NSMutableAttributedString(string: text)
                attributedString.apply(foregroundColor: color)

                let value = getTheme().font.letterSpacings.body1
                attributedString.apply(kernValue: value)

                return attributedString
            }

            let label = UILabel()
                       label.numberOfLines = 0
                       label.font = NatFonts.font(ofSize: .body1, withWeight: .regular)
                       label.translatesAutoresizingMaskIntoConstraints = false

            label.attributedText = createTextForTitle(text: body, withColor: getTheme().colors.highEmphasis)
            bodyView = label



            return self
        }

//        public func configure(body: NSAttributedString) -> Self {
//            let view = DialogStandardStyle.BodyView()
//            view.configure(body: body)
//
//            bodyView = view
//
//            return self
//        }

//        public func configure(body: UIView) -> Self {
//            bodyView = body
//
//            return self
//        }

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
                let footerView = DialogStandardStyle.FooterView()
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

