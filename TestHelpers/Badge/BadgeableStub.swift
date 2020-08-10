@testable import NatDS

class BadgeableStub: UIView, Badgeable {
    public init() {
        super.init(frame: .zero)
        backgroundColor = .darkGray
        addConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            widthAnchor.constraint(equalToConstant: 24),
            heightAnchor.constraint(equalToConstant: 24)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
