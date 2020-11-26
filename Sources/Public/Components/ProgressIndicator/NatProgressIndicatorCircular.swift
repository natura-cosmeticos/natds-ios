import UIKit
/**
 NatProgressIndicatorCircular is a class that represents  progress indicator circular  component from the design system.
 The component colors changes according with the current theme configured in the Design system.

 This component has 2 states:
 - showAndStartAnimation
 - hideAndStopAnimation

 Example of usage:

 - let activeProgressIndicator = NatProgressIndicator().configure(state: .showAndStartAnimation)

 - let hiddenProgressIndicator = NatProgressIndicator().configure(state: .hideAndStopAnimation)

 This progress indicator has a pre-defined radius value with NatSizes.Standard

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

 DesignSystem().configure(with: AvailableTheme)
 */

public class NatProgressIndicatorCircular: UIView {
    private var semiCircleLayer = CAShapeLayer()

    private enum Constants {
        static let rotationAnimationKey = "transform.rotation.z"
        static let semiCircleRotationAnimation = "rotationAnimation"
    }

    public init() {
        super.init(frame: .zero)
        layer.addSublayer(semiCircleLayer)
        configureSemiCircle(semiCircleLayer: semiCircleLayer)
    }

    // MARK: - Private Methods

    private func rotationAnimation() -> CABasicAnimation {
        let rotationAnimation = CABasicAnimation(keyPath: Constants.rotationAnimationKey)
        rotationAnimation.fromValue = CGFloat(Double.pi / 2)
        rotationAnimation.toValue = CGFloat(Double.pi * 2.5)
        rotationAnimation.repeatCount = Float.infinity
        rotationAnimation.duration = 1

        return rotationAnimation
    }

    private func createCirclePath() -> UIBezierPath {
        .init(
            arcCenter: CGPoint.zero,
            radius: getTokenFromTheme(\.sizeStandard),
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi * 2.5),
            clockwise: true
        )
    }

    private func configureSemiCircle(semiCircleLayer: CAShapeLayer) {
        semiCircleLayer.path = createCirclePath().cgPath
        semiCircleLayer.strokeColor = getUIColorFromTokens(\.colorPrimary).cgColor
        semiCircleLayer.fillColor = .none
        semiCircleLayer.lineWidth = getTokenFromTheme(\.sizeMicro)
    }

    // MARK: - Public Methods

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NatProgressIndicatorCircular {
    public enum State {
        case showAndStartAnimation
        case hideAndStopAnimation
    }

    public func configure(state: State) {
        switch state {
        case .showAndStartAnimation:
            isHidden = false
            semiCircleLayer.add(rotationAnimation(), forKey: Constants.semiCircleRotationAnimation)
        case .hideAndStopAnimation:
            isHidden = true
            semiCircleLayer.removeAllAnimations()
        }
    }
}
