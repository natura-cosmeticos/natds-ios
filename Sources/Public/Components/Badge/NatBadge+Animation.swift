extension NatBadge {

    internal func drawPulse() {
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: CGFloat(8/2),
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true)

        let circleBackground = UIBezierPath(
            arcCenter: CGPoint(x: centerCircleLayer.bounds.midX, y: centerCircleLayer.bounds.midY),
            radius: CGFloat(10/2),
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi * 3),
            clockwise: true)

        let circleContainer = UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: CGFloat(10/2),
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi * 3),
            clockwise: true)

        centerCircleLayer.path = circlePath.cgPath
        centerCircleLayer.position = CGPoint(x: circleLayerContainer.bounds.midX, y: circleLayerContainer.bounds.midY)

        backgroundCircleLayer.path = circleBackground.cgPath
        backgroundCircleLayer.position = CGPoint(x: circleLayerContainer.bounds.midX,
                                                 y: circleLayerContainer.bounds.midY)

        circleLayerContainer.path = circleContainer.cgPath
        circleLayerContainer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        circleLayerContainer.fillColor = UIColor.clear.cgColor

        circleLayerContainer.addSublayer(backgroundCircleLayer)
        layer.addSublayer(circleLayerContainer)
        layer.addSublayer(centerCircleLayer)
    }

    internal func scaleAnimation() {
        let sacleAnimation = CABasicAnimation(keyPath: "transform.scale")
        sacleAnimation.toValue = 1.5
        sacleAnimation.duration = 0.8
        sacleAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        sacleAnimation.autoreverses = true
        sacleAnimation.repeatCount = Float.infinity

        backgroundCircleLayer.add(sacleAnimation, forKey: "pulsing")
    }

    internal func opacityAnimation() {
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.2
        opacityAnimation.toValue = 1.0
        opacityAnimation.duration = 0.8
        opacityAnimation.repeatDuration = .infinity
        opacityAnimation.autoreverses = true
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)

        backgroundCircleLayer.add(opacityAnimation, forKey: "opacity")
    }

}
