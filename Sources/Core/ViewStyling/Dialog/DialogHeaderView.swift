final class DialogHeaderView: UIView {

    // MARK: - Private properties

    private var title: String
    private var label: UILabel = UILabel()

    // MARK: - Inits

    init(title: String) {
        self.title = title
        super.init(frame: .zero)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        label = DialogStyle.createLabelForTitle(title: title)
        addSubview(label)
        addConstraints()
    }

    private func addConstraints() {
        let sideMargins = getTokenFromTheme(\.sizeSmall)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sideMargins),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sideMargins)
        ])
    }
}
