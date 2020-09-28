protocol Pulsable: AnyObject {}

extension Pulsable {
    func beginPulseAt(
        point: CGPoint,
        in layer: CALayer,
        withColor color: UIColor = NatColors.highlight) {

        let opacity = getTokenFromTheme(\.opacityDisabledLow)
        let color = color.withAlphaComponent(opacity)

        let containedPulseLayer = PulseContainerLayer(color: color)
        containedPulseLayer.frame = layer.bounds
        containedPulseLayer.cornerRadius = layer.cornerRadius

        layer.insertSublayer(containedPulseLayer, below: nil)

        containedPulseLayer.startPulseAt(point: point)
    }

    func endPulse(layer: CALayer) {
        layer.sublayers?
            .compactMap { $0 as? PulseContainerLayer }
            .forEach { $0.endPulse() }
    }
}
