public class Divider: UIView {

    public init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Divider {

    private func setup() {
        backgroundColor = getTheme().colors.highlight.withAlphaComponent(0.12)
        addConstraints()
    }

    private func addConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
