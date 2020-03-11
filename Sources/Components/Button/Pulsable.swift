protocol Pulsable {
    var pulseLayer: PulseLayer { get }
}

extension Pulsable {

    func beginPulseAt(_ pulseLayer: PulseLayer, at point: CGPoint, in layer: CALayer) {
        pulseLayer.frame = layer.bounds
        pulseLayer.fillColor = Colors.Content.highEmphasis.withAlphaComponent(0.12).cgColor

        layer.insertSublayer(pulseLayer, above: nil)
        pulseLayer.startPulseAt(point: point)
    }

    func endPulse(pulseLayer: PulseLayer) {
        pulseLayer.endPulse()
    }
}
