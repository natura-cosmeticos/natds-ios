/// A protocol that enables a ripple effect (pulse) animation at an object.
/// You can conform your class to this protocol and use the methods to configure the animation.
public protocol Pulsable: AnyObject {}

extension Pulsable {

    /// Adds a ripple effect to an object
    /// - Parameters:
    ///   - point: the point where the animation should be added
    ///   - layer: the layer to receive the animation
    ///   - color: a color to the animation view
    ///   - removeAfterAnimation: a boolean indicating if the animation layer should be removed after the ripple effect
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

    /// Removes the animation layer from the object
    /// - Parameter layer: the layer from where the animation should be removed
    public func removePulseLayer(layer: CALayer) {
        layer.sublayers?
            .compactMap { $0 as? PulseLayer }
            .forEach { $0.endPulse() }
    }
}
