final class PulseContainerLayer: CAShapeLayer {
    private let pulseLayer: PulseLayer = PulseLayer()

    init(color: UIColor) {
        super.init()

        masksToBounds = true
        addSublayer(pulseLayer)

        pulseLayer.fillColor = color.cgColor
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
