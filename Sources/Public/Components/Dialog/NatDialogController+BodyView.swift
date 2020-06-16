extension NatDialogController {
    final class BodyView: UIView {
        private let label: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textColor = getTheme().colors.onSurface
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
            label.text = body
        }

        // MARK: - Private methods

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
