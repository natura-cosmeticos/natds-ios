enum DialogStyle {
    static func createLabelForTitle(title: String) -> UILabel {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .heading6, withWeight: .medium)
        label.attributedText = createTextForTitle(text: title, withColor: getTheme().colors.highEmphasis)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }

    static func createLabelForBody(body: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = NatFonts.font(ofSize: .body1, withWeight: .regular)
        label.attributedText = createTextForBody(text: body, withColor: getTheme().colors.highEmphasis)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }

    private static func createTextForTitle(text: String, withColor color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.apply(foregroundColor: color)

        let value = getTheme().font.letterSpacings.heading6
        attributedString.apply(kernValue: value)

        return attributedString
    }

    private static func createTextForBody(text: String, withColor color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.apply(foregroundColor: color)

        let value = getTheme().font.letterSpacings.body1
        attributedString.apply(kernValue: value)

        return attributedString
    }
}

private typealias ActionHandler = () -> Void

extension DialogStyle {
    final class FooterView: UIView {

        // MARK: - Private properties

        private let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = getTheme().spacing.tiny
            stackView.translatesAutoresizingMaskIntoConstraints = false

            return stackView
        }()

        private var primaryButtonActionHandler: ActionHandler?
        private var secondaryButtonActionHandler: ActionHandler?

        private var isFirstTimeInLayoutSubviews = true

        // MARK: - Inits

        init() {
            super.init(frame: .zero)

            setup()
        }

        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: - Inits

        deinit {
            NotificationCenter.default.removeObserver(self)
        }

        // MARK: - Overrides

        override func layoutSubviews() {
            super.layoutSubviews()

            if isFirstTimeInLayoutSubviews {
                adjustButtonsToFitScreen()
                isFirstTimeInLayoutSubviews = false
            }
        }

        // MARK: - Action handlers

        @objc private func primaryActionHandler() {
            primaryButtonActionHandler?()
        }

        @objc private func secondaryActionHandler() {
            secondaryButtonActionHandler?()
        }

        // MARK: - Public methods

        func configure(primaryButton configuration: NatDialogController.ButtonConfiguration) {
            primaryButtonActionHandler = configuration.action

            let button = NatButton(style: configuration.style)
            button.configure(title: configuration.title)
            button.addTarget(self, action: #selector(primaryActionHandler), for: .touchUpInside)
            setupButton(button: button)
        }

        func configure(secondaryButton configuration: NatDialogController.ButtonConfiguration) {
            secondaryButtonActionHandler = configuration.action

            let button = NatButton(style: configuration.style)
            button.configure(title: configuration.title)
            button.addTarget(self, action: #selector(secondaryActionHandler), for: .touchUpInside)

            setupButton(button: button)
        }

        // MARK: - Private methods

        private func setupButton(button: NatButton) {
            button.translatesAutoresizingMaskIntoConstraints = false

            stackView.insertArrangedSubview(button, at: 0)

            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: NatButton.Height.medium)
            ])
        }

        private func setup() {
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(adjustButtonsToFitScreen),
                name: UIDevice.orientationDidChangeNotification,
                object: nil
            )

            addSubview(stackView)

            addConstraints()
        }

        @objc private func adjustButtonsToFitScreen() {
            stackView.axis = stackView.frame.width >= frame.width ? .vertical : .horizontal
        }

        private func addConstraints() {
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor)
            ])
        }
    }
}
