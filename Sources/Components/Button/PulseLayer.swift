class PulseLayer: CAShapeLayer {

    static let kOpacityPath = "opacity"
    static let kPositionPath = "position"
    static let kTransformScalePath = "transform.scale"

    static let kAnimationFadeOutDuration: Double = 0.15
    static let kAnimationFadeInDuration: Double = 0.075
    static let kAnimationGroupDuration: Double = 0.3

    static func defaultPulseRadius(rect: CGRect) -> CGFloat {
        return hypot(rect.midX, rect.midY)
    }

    private var startPulseAnimationActive = false
    private var pulseStartAnimationTime: CFTimeInterval = 0

    override func setNeedsLayout() {
        super.setNeedsLayout()

        setPathFromRadii()
        self.position = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
    }

    private func setPathFromRadii() {
        let radius = PulseLayer.defaultPulseRadius(rect: self.bounds)
        let width = radius * 2
        let ovalRect = CGRect(x: self.bounds.midX - radius, y: self.bounds.midY - radius, width: width, height: width)

        let circlePath = UIBezierPath(ovalIn: ovalRect)
        self.path = circlePath.cgPath
    }

    private func createScaleAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = PulseLayer.kTransformScalePath
        animation.fromValue = 0.2
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: .default)
        return animation
    }

    private func createPositionAnimation(point: CGPoint) -> CAKeyframeAnimation {
        let centerPath = UIBezierPath()
        let startPoint = point
        let endPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midY)

        centerPath.move(to: startPoint)
        centerPath.addLine(to: endPoint)

        let animation = CAKeyframeAnimation()
        animation.keyPath = PulseLayer.kPositionPath
        animation.path = centerPath.cgPath
        animation.timingFunction = CAMediaTimingFunction(name: .default)

        return animation
    }

    private func createFadeInAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = PulseLayer.kOpacityPath
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = PulseLayer.kAnimationFadeInDuration
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        return animation
    }

    private func createFadeOutAnimation(duration: Double) -> CABasicAnimation {
        let delay = startPulseAnimationActive ? PulseLayer.kAnimationFadeOutDuration : 0

        let animation = CABasicAnimation()
        animation.keyPath = PulseLayer.kOpacityPath
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = duration
        animation.beginTime = self.convertTime(pulseStartAnimationTime + delay, from: nil)
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

extension PulseLayer {

    func startPulseAt(point: CGPoint) {
        setNeedsLayout()
        self.opacity = 1

        startPulseAnimationActive = true

        CATransaction.begin()
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = PulseLayer.kAnimationGroupDuration

        animationGroup.animations = [
            createScaleAnimation(),
            createPositionAnimation(point: point),
            createFadeInAnimation()
        ]

        CATransaction.setCompletionBlock { [weak self] in
            self?.startPulseAnimationActive = false
        }

        pulseStartAnimationTime = CACurrentMediaTime()
        self.add(animationGroup, forKey: nil)
        CATransaction.commit()
    }

    func endPulse() {
        CATransaction.begin()

        let animation = createFadeOutAnimation(duration: PulseLayer.kAnimationGroupDuration)

        CATransaction.setCompletionBlock { [weak self] in
            self?.removeFromSuperlayer()
        }

        self.add(animation, forKey: nil)
        CATransaction.commit()
    }
}
