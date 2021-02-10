import UIKit
/**
 NatProgressIndicatorCircular is a class that represents progress indicator circular component from the Design System.
 The component colors changes according with the current theme configured in the Design System.

 This component has 2 actions:
 - showAndStartAnimation
 - hideAndStopAnimation

         Example of usage:
         - progressIndicator.configure(state: .showAndStartAnimation)
         - hiddenProgressIndicator.configure(state: .hideAndStopAnimation)

 This progress indicator has a pre-defined radius value with NatSizes.Standard.
 The constraints for width and height should use the pre-defined size:
 
     Example of usage:
     - progressIndicator.heightAnchor.constraint(equalToConstant: NatProgressIndicatorCircular.Size.standard)
     - progressIndicator.widthAnchor.constraint(equalToConstant: NatProgressIndicatorCircular.Size.standard)

 - Requires:
    It's necessary to configure the Design System with a theme or fatalError will be raised.
 
        DesignSystem().configure(with: AvailableTheme)
 */

public class NatProgressIndicatorCircular: UIView {
    /**
     Action is a enum that represents actions for the NatProgressIndicatorCircular component.

        These are all sizes allowed for a NatProgressIndicatorCircular:
        - showAndStartAnimation
        - hideAndStopAnimation
    */
    public enum Action {
        case showAndStartAnimation
        case hideAndStopAnimation
    }

    // MARK: - Private properties

    private var semiCircleLayer = CAShapeLayer()

    private enum Constants {
        static let rotationAnimationKey = "transform.rotation.z"
        static let semiCircleRotationAnimation = "rotationAnimation"
    }

    // MARK: - Inits

    public init() {
        super.init(frame: .zero)
        clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    public func configure(with action: Action, size: Size = .large) {
        switch action {
        case .showAndStartAnimation:
            configureSemiCircle(semiCircleLayer: semiCircleLayer, size: size.value)
            semiCircleLayer.add(rotationAnimation(), forKey: Constants.semiCircleRotationAnimation)
            layer.addSublayer(semiCircleLayer)
            isHidden = false
        case .hideAndStopAnimation:
            isHidden = true
            semiCircleLayer.removeAllAnimations()
        }
    }

    public func configure(useBackgroundLayer: Bool) {
        if useBackgroundLayer {
            backgroundColor = .blue
            layer.cornerRadius = frame.size.width/2
            clipsToBounds = true
        }
    }

    // MARK: - Private methods

    private func rotationAnimation() -> CABasicAnimation {
        let rotationAnimation = CABasicAnimation(keyPath: Constants.rotationAnimationKey)
        rotationAnimation.fromValue = CGFloat(Double.pi / 2)
        rotationAnimation.toValue = CGFloat(Double.pi * 2.5)
        rotationAnimation.repeatCount = Float.infinity
        rotationAnimation.duration = 1

        return rotationAnimation
    }

    private func createCirclePath(size: CGFloat) -> UIBezierPath {

        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: semiCircleLayer.bounds.midX, y: semiCircleLayer.bounds.midY),
            radius: CGFloat(size/2),
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi * 2.5),
            clockwise: true)

        return circlePath
    }

    private func createCircleBackground(size: CGFloat) -> UIBezierPath {

        let circleBackground = UIBezierPath(
            arcCenter: CGPoint(x: semiCircleLayer.bounds.midX, y: semiCircleLayer.bounds.midY),
            radius: CGFloat(size/2 + 4),
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi * 2.5),
            clockwise: true)

        return circleBackground
    }

    private func configureSemiCircle(semiCircleLayer: CAShapeLayer, size: CGFloat) {
        semiCircleLayer.path = createCirclePath(size: size).cgPath
        semiCircleLayer.strokeColor = getUIColorFromTokens(\.colorPrimary).cgColor
        semiCircleLayer.fillColor = .none
        semiCircleLayer.lineWidth = getTokenFromTheme(\.sizeMicro)
        semiCircleLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
    }
}
