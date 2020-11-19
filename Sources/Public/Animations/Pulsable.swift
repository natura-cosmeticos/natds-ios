public protocol Pulsable: AnyObject {}

extension Pulsable {

    public func addPulseLayerAnimated(at point: CGPoint,
                                      in layer: CALayer,
                                      withColor color: UIColor? = nil,
                                      removeAfterAnimation: Bool) {

        let pulseLayer = PulseLayer()
        pulseLayer.frame = layer.bounds
        pulseLayer.cornerRadius = layer.cornerRadius

        if let color = color {
            pulseLayer.fillColor = color.cgColor
        }

        layer.insertSublayer(pulseLayer, below: nil)

        pulseLayer.startPulseAt(point: point, removeAfterAnimation: removeAfterAnimation)
    }

    public func removePulseLayer(layer: CALayer) {
        layer.sublayers?
            .compactMap { $0 as? PulseLayer }
            .forEach { $0.endPulse() }
    }
}
