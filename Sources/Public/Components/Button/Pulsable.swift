protocol Pulsable: AnyObject {}

extension Pulsable {
    func beginPulseAt(point: CGPoint, in layer: CALayer) {
        let containedPulseLayer = PulseContainerLayer()
        containedPulseLayer.frame = layer.bounds

        layer.insertSublayer(containedPulseLayer, above: nil)

        containedPulseLayer.startPulseAt(point: point)
    }

    func endPulse(layer: CALayer) {
        layer.sublayers?
            .compactMap { $0 as? PulseContainerLayer }
            .forEach { $0.endPulse() }
    }
}
