public class Divider: UIView {
    public override init(frame: CGRect) {
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
        backgroundColor = Colors.highlight.withAlphaComponent(0.12)
        addLineView()
    }

    private func addLineView() {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
