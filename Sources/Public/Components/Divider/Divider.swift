/**
  Divider is a class that represents Divider component from the design system.

    It has a predetermined height, and to configure its width It's necessary use via constraints

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

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
        backgroundColor = getUIColorFromTokens(\.colorHighlight).withAlphaComponent(0.12)
        addConstraints()
    }

    private func addConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
