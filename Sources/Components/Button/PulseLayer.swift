import UIKit

class PulseLayer: CAShapeLayer {

    static let kExpandBeyondSuface: CGFloat = 10

    static func defaultPulseRadius(rect: CGRect) -> CGFloat {
        return hypot(rect.midX, rect.midY) + kExpandBeyondSuface
    }

    var startPulseAnimationActive = false
    var pulseStartAnimationTime: CFTimeInterval = 0

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

    private func standartTimingFuction() -> CAMediaTimingFunction {
        return CAMediaTimingFunction(controlPoints: 0.4, 0, 0.2, 1)
    }

    private func createScaleAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale"
        animation.fromValue = 0.2
        animation.toValue = 1
        animation.timingFunction = standartTimingFuction()
        return animation
    }

    private func createPositionAnimation(point: CGPoint) -> CAKeyframeAnimation {
        let centerPath = UIBezierPath()
        let startPoint = point
        let endPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midY)

        centerPath.move(to: startPoint)
        centerPath.addLine(to: endPoint)

        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.path = centerPath.cgPath
        animation.keyTimes = [0, 1]
        animation.values = [0, 1]
        animation.timingFunction = standartTimingFuction()

        return animation
    }

    private func createFadeInAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = "opacity"
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.075
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        return animation
    }

    private func createFadeOutAnimation(duration: Double) -> CABasicAnimation {
        var delay: TimeInterval = 0

        if startPulseAnimationActive {
            delay = 0.15
        }

        let animation = CABasicAnimation()
        animation.keyPath = "opacity"
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
        animationGroup.duration = 0.225

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

    func endPulse(animated: Bool) {
        CATransaction.begin()

        let animation = createFadeOutAnimation(duration: animated ? 0.2 : 0)

        CATransaction.setCompletionBlock { [weak self] in
            self?.removeFromSuperlayer()
        }

        self.add(animation, forKey: nil)
        CATransaction.commit()
    }
}
