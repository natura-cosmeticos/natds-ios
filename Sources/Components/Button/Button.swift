public class Button: UIButton {

    private var activePulseLayer: PulseLayer?
    private let pulseContainerLayer = CAShapeLayer()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        layoutPulseContainerLayer()
    }

    public override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title?.uppercased(), for: state)
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        if let touch = touches.first {
            let point = touch.location(in: self)
            self.beginPulseAt(point: point)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.endPulse()
    }

    private func setup() {
        layer.cornerRadius = 4.0

        titleLabel?.font = Fonts.button
        titleEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

        addPulseContainerLayer()
    }
}

extension Button {

    private func addPulseContainerLayer() {
        pulseContainerLayer.zPosition = 0
        pulseContainerLayer.masksToBounds = true
        layer.addSublayer(pulseContainerLayer)
    }

    private func layoutPulseContainerLayer() {
        pulseContainerLayer.frame = bounds
        pulseContainerLayer.cornerRadius = layer.cornerRadius
    }

    func beginPulseAt(point: CGPoint) {
        let pulseLayer = PulseLayer()
        pulseLayer.frame = bounds
        pulseLayer.fillColor = Colors.Content.highEmphasis.withAlphaComponent(0.12).cgColor

        pulseContainerLayer.insertSublayer(pulseLayer, above: nil)
        pulseLayer.startPulseAt(point: point)

        self.activePulseLayer = pulseLayer
    }

    func endPulse() {
        guard let pulseLayer = activePulseLayer else { return }
        pulseLayer.endPulse()
    }
}
