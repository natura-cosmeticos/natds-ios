extension NatDialogController {
    final class FooterView: UIView {

        // MARK: - Private properties

        private let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = getTheme().spacing.tiny
            stackView.translatesAutoresizingMaskIntoConstraints = false

            return stackView
        }()

        private let primaryButton: NatButton = {
            let button = NatButton(style: .contained)
            button.translatesAutoresizingMaskIntoConstraints = false

            return button
        }()

        private let secondaryButton: NatButton = {
            let button = NatButton(style: .outlined)
            button.translatesAutoresizingMaskIntoConstraints = false

            return button
        }()

        private let primaryAction: ButtonAction
        private let secondaryAction: ButtonAction

        private var shouldEvaluateButtonsPosition = true

        // MARK: - Inits

        init(primaryAction: ButtonAction, secondaryAction: ButtonAction) {
            self.primaryAction = primaryAction
            self.secondaryAction = secondaryAction

            super.init(frame: .zero)

            setup()

            NotificationCenter.default.addObserver(
                self,
                selector: #selector(rotated),
                name: UIDevice.orientationDidChangeNotification,
                object: nil
            )
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: - Inits

        deinit {
            NotificationCenter.default.removeObserver(self)
        }

        @objc func rotated() {
            adjustButtonsToFitScreen()
        }

        // MARK: - Overrides

        override func layoutSubviews() {
            super.layoutSubviews()

            if shouldEvaluateButtonsPosition {
                adjustButtonsToFitScreen()
                shouldEvaluateButtonsPosition = false
            }
        }

        private func adjustButtonsToFitScreen() {
            print("StackView: \(stackView.frame.width)")
            print("view: \(frame.width)")

            if stackView.frame.width >= frame.width {
                stackView.axis = .vertical
            } else if stackView.frame.width < frame.width {
                stackView.axis = .horizontal
            }

//            stackView.axis = stackView.frame.width >= frame.width ? .vertical : .horizontal
        }

        // MARK: - Private methods

        private func setup() {
            primaryButton.configure(title: primaryAction.title)
            secondaryButton.configure(title: secondaryAction.title)

            addSubview(stackView)

            stackView.insertArrangedSubview(primaryButton, at: 0)
            stackView.insertArrangedSubview(secondaryButton, at: 0)

            addConstraints()
        }

        private func addConstraints() {
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
                stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),

                primaryButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),
                secondaryButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium)
            ])
        }
    }
}
