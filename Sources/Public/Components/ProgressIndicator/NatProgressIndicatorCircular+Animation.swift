import UIKit

extension NatProgressIndicatorCircular {

    internal func rotationAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: Constants.rotationZ)
        animation.duration = 4
        animation.fromValue = 0
        animation.toValue = (2.0 * .pi)
        animation.repeatCount = .infinity

        return animation
    }

    internal func springAnimation() -> CAAnimationGroup {
        let animation = CAAnimationGroup()
        animation.duration = 1.5
        animation.animations = [
            strokeStartAnimation(),
            strokeEndAnimation(),
            strokeCatchAnimation(),
            strokeFreezeAnimation()
        ]
        animation.repeatCount = .infinity

        return animation
    }

    private func strokeStartAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: Constants.strokeStart)
        animation.duration = 1
        animation.fromValue = 0
        animation.toValue = 0.15
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        return animation
    }

    private func strokeEndAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: Constants.strokeEnd)
        animation.duration = 1
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        return animation
    }

    private func strokeCatchAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: Constants.strokeStart)
        animation.beginTime = 1
        animation.duration = 0.5
        animation.fromValue = 0.15
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        return animation
    }
    
    private func strokeFreezeAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: Constants.strokeEnd)
        animation.beginTime = 1
        animation.duration = 0.5
        animation.fromValue = 1
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        return animation
    }
}
