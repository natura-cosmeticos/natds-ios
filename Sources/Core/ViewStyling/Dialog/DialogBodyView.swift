final class DialogBodyView: UIView {

    // MARK: - Private properties
    
    private var body: String
    private var label: UILabel = UILabel()
    private var isFirstTimeInLayoutSubviews = true

    // MARK: - Inits

    init(body: String) {
        self.body = body
        super.init(frame: .zero)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overrides

    override func layoutSubviews() {
        super.layoutSubviews()

        if isFirstTimeInLayoutSubviews {
            isFirstTimeInLayoutSubviews = false
        }
    }

    private func setup() {
        label = DialogStyle.createLabelForBody(body: body)
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
