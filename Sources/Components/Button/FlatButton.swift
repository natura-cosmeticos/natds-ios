public class FlatButton: UIButton {

    private let pulse = Pulse()

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
            pulse.beginPulseAt(point: point, in: layer)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        pulse.endPulse()
    }
}

private extension FlatButton {

    private func setup() {
        layer.cornerRadius = 4.0
        layer.masksToBounds = true

        backgroundColor = .clear
        titleLabel?.font = Fonts.button
        titleEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

        setTitleColor(Colors.primary, for: .normal)
        setTitleColor(Colors.Content.highEmphasis.withAlphaComponent(0.48), for: .disabled)
    }
}
