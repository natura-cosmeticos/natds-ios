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
