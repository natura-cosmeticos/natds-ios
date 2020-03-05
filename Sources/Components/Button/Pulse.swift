class Pulse {

    private(set) var activePulseLayer: PulseLayer?

    func beginPulseAt(point: CGPoint, in layer: CALayer) {
        let pulseLayer = PulseLayer()
        pulseLayer.frame = layer.bounds
        pulseLayer.fillColor = Colors.Content.highEmphasis.withAlphaComponent(0.12).cgColor

        layer.insertSublayer(pulseLayer, above: nil)
        pulseLayer.startPulseAt(point: point)

        self.activePulseLayer = pulseLayer
    }

    func endPulse() {
        guard let pulseLayer = activePulseLayer else { return }
        pulseLayer.endPulse()
    }
}
