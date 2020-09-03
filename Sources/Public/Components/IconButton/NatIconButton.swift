import Foundation

public final class NatIconButton: UIView {
    public enum State {
        case eneable
        case disabled
    }

    private let iconView: IconView = {
        let iconView = IconView(fontSize: NatSizes.standard)
        iconView.icon = .outlinedDefaultMockup
        iconView.translatesAutoresizingMaskIntoConstraints = false

        return iconView
    }()

    private let style: Style
    private var action: (() -> Void)?
    private (set) var currentState: State = .eneable

    public init(style: Style) {
        self.style = style

        super.init(frame: .zero)

        setup()

        style.applyStyle(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(iconView)
        addConstraints()
    }

    private func addConstraints() {
        let constraints = [
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = bounds.height / 2
    }

    @objc func tapHandler(_ sender: UIGestureRecognizer) {
        action?()
        endPulse(layer: layer)
    }

    // MARK: - Overrides

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        guard currentState == .eneable else { return }

        beginPulseAt(
            point: centerBounds,
            in: layer,
            withColor: iconView.tintColor
        )
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        endPulse(layer: layer)
    }

    public func configure(action: @escaping () -> Void) {
        self.action = action
    }

    public func configure(state: State) {
        currentState = state

        style.applyStyle(self)
    }

    public func configure(icon: Icon) {
        print("icon")
    }

    func configure(iconColor: UIColor) {
        iconView.tintColor = iconColor
    }
}
extension NatIconButton {
    public struct Style {
        let applyStyle: (NatIconButton) -> Void

        public static var standardDefault: Style {
            .init(
                applyStyle: IconButtonStandardStyle.applyDefaultStyle
            )
        }

        public static var standardPrimary: Style {
            .init(
                applyStyle: IconButtonStandardStyle.applyPrimaryStyle
            )
        }
    }
}

extension NatIconButton: Pulsable {}
