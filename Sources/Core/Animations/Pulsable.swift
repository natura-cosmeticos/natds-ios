protocol Pulsable: AnyObject {}

extension Pulsable {

    func addPulseLayerAnimated(at point: CGPoint,
                               in layer: CALayer,
                               withColor color: UIColor = NatColors.highlight,
                               removeAfterAnimation: Bool) {

        let opacity = getTokenFromTheme(\.opacityDisabledLow)
        let color = color.withAlphaComponent(opacity)

        let containedPulseLayer = PulseContainerLayer(color: color)
        containedPulseLayer.frame = layer.bounds
        containedPulseLayer.cornerRadius = layer.cornerRadius

        layer.insertSublayer(containedPulseLayer, below: nil)

        containedPulseLayer.startPulseAt(point: point, removeAfterAnimation: removeAfterAnimation)
    }

    func removePulseLayer(layer: CALayer) {
        layer.sublayers?
            .compactMap { $0 as? PulseContainerLayer }
            .forEach { $0.endPulse() }
    }
}
