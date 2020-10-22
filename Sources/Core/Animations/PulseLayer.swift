final class PulseLayer: CAShapeLayer {

    // MARK: - Private properties

    private let containerLayer = CAShapeLayer()
    private let kOpacityPath = "opacity"
    private let kPositionPath = "position"
    private let kTransformScalePath = "transform.scale"
    private let kAnimationFadeOutDuration: Double = 0.15
    private let kAnimationFadeInDuration: Double = 0.075
    private let kAnimationGroupDuration: Double = 0.3
    private var startPulseAnimationActive = false
    private var pulseStartAnimationTime: CFTimeInterval = 0

    // MARK: - Overrides properties

    override var frame: CGRect {
        didSet {
            containerLayer.frame = bounds
        }
    }

    override var fillColor: CGColor? {
        didSet {
            containerLayer.fillColor = fillColor
        }
    }

    // MARK: - Inits

    override init() {
        super.init()

        masksToBounds = true
        addSublayer(containerLayer)

        let opacity = getTokenFromTheme(\.opacityDisabledLow)
        let color = NatColors.highlight.withAlphaComponent(opacity)
        containerLayer.fillColor = color.cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overrides methods

    override func setNeedsLayout() {
        super.setNeedsLayout()

        setPathFromRadii()
        containerLayer.position = CGPoint(x: containerLayer.bounds.midX, y: containerLayer.bounds.midY)
    }
}

// MARK: - Internal methods

extension PulseLayer {
    func startPulseAt(point: CGPoint, removeAfterAnimation: Bool) {
        setNeedsLayout()
        opacity = 1

        startPulseAnimationActive = true
        createStartPulseAnimationGroupBy(point: point, removeAfterAnimation: removeAfterAnimation)
        pulseStartAnimationTime = CACurrentMediaTime()
    }

    func endPulse(completion: (() -> Void)? = nil) {
        CATransaction.begin()

        let animation = createFadeOutAnimation(duration: kAnimationGroupDuration)

        CATransaction.setCompletionBlock { [weak self] in
            self?.removeFromSuperlayer()
            completion?()
        }

        containerLayer.add(animation, forKey: nil)
        CATransaction.commit()
    }
}

// MARK: - Private methods

extension PulseLayer {
    private func setPathFromRadii() {
        let radius = hypot(containerLayer.bounds.midX, containerLayer.bounds.midY)
        let width = radius * 2
        let ovalRect = CGRect(
            x: containerLayer.bounds.midX - radius,
            y: containerLayer.bounds.midY - radius,
            width: width,
            height: width
        )

        let circlePath = UIBezierPath(ovalIn: ovalRect)
        containerLayer.path = circlePath.cgPath
    }

    private func createStartPulseAnimationGroupBy(point: CGPoint, removeAfterAnimation: Bool) {
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

            if removeAfterAnimation {
                self?.endPulse()
            }
        }

        containerLayer.add(animationGroup, forKey: nil)
        CATransaction.commit()
    }
}

// MARK: - Private methods - Animations

extension PulseLayer {
    private func createPositionAnimation(point: CGPoint) -> CAKeyframeAnimation {
        let centerPath = UIBezierPath()
        let startPoint = point
        let endPoint = CGPoint(x: containerLayer.bounds.midX, y: containerLayer.bounds.midY)

        centerPath.move(to: startPoint)
        centerPath.addLine(to: endPoint)

        let animation = CAKeyframeAnimation()
        animation.keyPath = kPositionPath
        animation.path = centerPath.cgPath
        animation.timingFunction = .init(name: .default)

        return animation
    }

    private func createScaleAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = kTransformScalePath
        animation.fromValue = 0.2
        animation.toValue = 1
        animation.timingFunction = .init(name: .default)

        return animation
    }

    private func createFadeInAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = kOpacityPath
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = kAnimationFadeInDuration
        animation.timingFunction = .init(name: .linear)

        return animation
    }

    private func createFadeOutAnimation(duration: Double) -> CABasicAnimation {
        let delay = startPulseAnimationActive ? kAnimationFadeOutDuration : 0

        let animation = CABasicAnimation()
        animation.keyPath = kOpacityPath
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = duration
        animation.beginTime = convertTime(pulseStartAnimationTime + delay, from: nil)
        animation.timingFunction = .init(name: .linear)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false

        return animation
    }
}
