class PulseLayer: CAShapeLayer {

    private let kOpacityPath = "opacity"
    private let kPositionPath = "position"
    private let kTransformScalePath = "transform.scale"
    private let kAnimationFadeOutDuration: Double = 0.15
    private let kAnimationFadeInDuration: Double = 0.075
    private let kAnimationGroupDuration: Double = 0.3
    private var startPulseAnimationActive = false
    private var pulseStartAnimationTime: CFTimeInterval = 0

    override func setNeedsLayout() {
        super.setNeedsLayout()

        setPathFromRadii()
        self.position = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
    }

    private func defaultPulseRadius(rect: CGRect) -> CGFloat {
        return hypot(rect.midX, rect.midY)
    }

    private func setPathFromRadii() {
        let radius = defaultPulseRadius(rect: self.bounds)
        let width = radius * 2
        let ovalRect = CGRect(x: self.bounds.midX - radius, y: self.bounds.midY - radius, width: width, height: width)

        let circlePath = UIBezierPath(ovalIn: ovalRect)
        self.path = circlePath.cgPath
    }

    private func createScaleAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = kTransformScalePath
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
        animation.keyPath = kPositionPath
        animation.path = centerPath.cgPath
        animation.timingFunction = CAMediaTimingFunction(name: .default)

        return animation
    }

    private func createFadeInAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = kOpacityPath
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = kAnimationFadeInDuration
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        return animation
    }

    private func createFadeOutAnimation(duration: Double) -> CABasicAnimation {
        let delay = startPulseAnimationActive ? kAnimationFadeOutDuration : 0

        let animation = CABasicAnimation()
        animation.keyPath = kOpacityPath
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = duration
        animation.beginTime = self.convertTime(pulseStartAnimationTime + delay, from: nil)
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }

    private func createStartPulseAnimationGroupBy(point: CGPoint) {
        CATransaction.begin()
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = kAnimationGroupDuration

        animationGroup.animations = [
            createScaleAnimation(),
            createPositionAnimation(point: point),
            createFadeInAnimation()
        ]

        CATransaction.setCompletionBlock { [weak self] in
            self?.startPulseAnimationActive = false
        }

        self.add(animationGroup, forKey: nil)
        CATransaction.commit()
    }
}

extension PulseLayer {

    func startPulseAt(point: CGPoint) {
        setNeedsLayout()
        self.opacity = 1

        startPulseAnimationActive = true
        createStartPulseAnimationGroupBy(point: point)
        pulseStartAnimationTime = CACurrentMediaTime()
    }

    func endPulse(completion: (() -> Void)? = nil) {
        CATransaction.begin()

        let animation = createFadeOutAnimation(duration: kAnimationGroupDuration)

        CATransaction.setCompletionBlock { [weak self] in
            self?.removeFromSuperlayer()
            completion?()
        }

        self.add(animation, forKey: nil)
        CATransaction.commit()
    }
}
