final class PulseContainerLayer: CAShapeLayer {
    private let pulseLayer: PulseLayer = PulseLayer()

    override init() {
        super.init()

        masksToBounds = true
        addSublayer(pulseLayer)

        let opacity = getTokenFromTheme(\.opacity05)
        pulseLayer.fillColor = NatColors.highlight.withAlphaComponent(opacity).cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var frame: CGRect {
        didSet {
            pulseLayer.frame = bounds
        }
    }

    func startPulseAt(point: CGPoint) {
        pulseLayer.startPulseAt(point: point)
    }

    func endPulse() {
        pulseLayer.endPulse { [weak self] in self?.removeFromSuperlayer() }
    }
}
