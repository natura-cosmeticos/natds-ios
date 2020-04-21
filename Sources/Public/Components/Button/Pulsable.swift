protocol Pulsable: AnyObject {
    var pulseLayer: PulseLayer? { get set }
}

extension Pulsable {

    func beginPulseAt(point: CGPoint, in layer: CALayer) {
        let pulseLayer = PulseLayer()
        pulseLayer.frame = layer.bounds
        pulseLayer.fillColor = Colors.Content.highEmphasis.withAlphaComponent(0.12).cgColor

        layer.insertSublayer(pulseLayer, above: nil)
        pulseLayer.startPulseAt(point: point)

        self.pulseLayer = pulseLayer
    }

    func endPulse() {
        guard let pulseLayer = self.pulseLayer else { return }
        pulseLayer.endPulse()
    }
}
