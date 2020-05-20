protocol Pulsable: AnyObject {}

extension Pulsable {
    func beginPulseAt(point: CGPoint, in layer: CALayer) {
        let containedPulseLayer = ContainedPulseLayer()
        containedPulseLayer.frame = layer.bounds

        layer.insertSublayer(containedPulseLayer, above: nil)

        containedPulseLayer.startPulseAt(point: point)
    }

    func endPulse(layer: CALayer) {
        layer.sublayers?
            .compactMap { $0 as? ContainedPulseLayer }
            .forEach { $0.endPulse() }
    }
}

class ContainedPulseLayer: CAShapeLayer {
    let pulseLayer: PulseLayer = PulseLayer()

    override init() {
        super.init()

        masksToBounds = true
        addSublayer(pulseLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var frame: CGRect {
        didSet {
            pulseLayer.frame = bounds
            pulseLayer.fillColor = Colors.Content.highEmphasis.withAlphaComponent(0.12).cgColor
        }
    }

    func startPulseAt(point: CGPoint) {
        pulseLayer.startPulseAt(point: point)
    }

    func endPulse() {
        pulseLayer.endPulse { self.removeFromSuperlayer() }
    }
}
