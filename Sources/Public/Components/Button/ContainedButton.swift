@available(*, deprecated, message: "Use NatButton(style: .contained) instead")

public class ContainedButton: UIButton, Pulsable {
    public override var isEnabled: Bool {
        didSet {
            updateBackgroundByState()
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title?.uppercased(), for: state)
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        if let touch = touches.first {
            let point = touch.location(in: self)
            beginPulseAt(point: point, in: layer)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        endPulse(layer: layer)
    }
}

extension ContainedButton {

    private func setup() {
        layer.cornerRadius = 4.0

        titleLabel?.font = Fonts.button
        contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

        setTitleColor(Colors.Content.highEmphasis, for: .normal)
        setTitleColor(Colors.Content.highEmphasis.withAlphaComponent(0.24), for: .disabled)

        setShadow()
        updateBackgroundByState()
    }

    private func setShadow() {
        layer.shadowColor = Colors.Content.highlight.withAlphaComponent(0.14).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
    }

    private func updateBackgroundByState() {
        switch self.state {
        case .disabled:
            backgroundColor = Colors.Content.highlight.withAlphaComponent(0.12)
        default:
            backgroundColor = Colors.primary
        }
    }
}
