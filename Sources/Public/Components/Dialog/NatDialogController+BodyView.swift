extension NatDialogController {
    final class BodyView: UIView {
        private let label: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false

            return label
        }()

        // MARK: - Inits

        init() {
            super.init(frame: .zero)

            setup()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: - Public methods

        func set(body: String) {
            label.attributedText = createTextForTitle(text: body, withColor: getTheme().colors.highEmphasis)
        }

        // MARK: - Private methods

        private func createTextForTitle(text: String, withColor color: UIColor) -> NSAttributedString {
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.apply(foregroundColor: color)

            let value = getTheme().font.letterSpacings.body1
            attributedString.apply(kernValue: value)

            return attributedString
        }

        private func setup() {
            addSubview(label)

            addConstraints()
        }

        private func addConstraints() {
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: topAnchor),
                label.trailingAnchor.constraint(equalTo: trailingAnchor),
                label.bottomAnchor.constraint(equalTo: bottomAnchor),
                label.leadingAnchor.constraint(equalTo: leadingAnchor)
            ])
        }
    }
}
