extension NatDialogController {
    final class TitleView: UIView {
        private let label: UILabel = {
            let label = UILabel()
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

        func set(title: String) {
            label.text = title
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
