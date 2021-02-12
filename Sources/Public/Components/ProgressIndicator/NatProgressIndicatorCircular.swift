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
    internal var circleLayer = CAShapeLayer()

    // MARK: - Inits

    public init() {
        super.init(frame: .zero)
        clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    public func configure(with action: Action, size: Size = .medium) {
        switch action {
        case .showAndStartAnimation:
            addCircleAndSemiCircle(size: size.value)
            isHidden = false
        case .hideAndStopAnimation:
            isHidden = true
            semiCircleLayer.removeAllAnimations()
        }
    }

    public func configure(useBackgroundLayer: Bool) {
        if useBackgroundLayer {
            circleLayer.fillColor =  UIColor.white.cgColor
            clipsToBounds = true
        } else {
            circleLayer.fillColor =  UIColor.clear.cgColor
        }
    }

    // MARK: - Private methods

    private func createCirclePath(size: CGFloat) -> UIBezierPath {

        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: circleLayer.bounds.midX, y: circleLayer.bounds.midY),
            radius: CGFloat(size/2),
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true)

        return circlePath
    }

    private func configureSemiCircle(semiCircleLayer: CAShapeLayer, size: CGFloat) {
        semiCircleLayer.path = createCirclePath(size: size).cgPath
        semiCircleLayer.strokeColor = getUIColorFromTokens(\.colorPrimary).cgColor
        semiCircleLayer.fillColor = .none
        semiCircleLayer.lineWidth = getTokenFromTheme(\.sizeMicro)
        semiCircleLayer.position = CGPoint(x: circleLayer.bounds.midX, y: circleLayer.bounds.midY)
    }

    private func createCircleBackground(size: CGFloat) -> UIBezierPath {

        let circleBackground = UIBezierPath(
            arcCenter: CGPoint(x: circleLayer.bounds.midX, y: circleLayer.bounds.midY),
            radius: CGFloat(size/2 + getTokenFromTheme(\.sizeTiny)),
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi * 3),
            clockwise: true)

        return circleBackground
    }

    private func configureCircleBackground(circleLayer: CAShapeLayer, size: CGFloat) {
        circleLayer.path = createCircleBackground(size: size).cgPath
        circleLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)

        circleLayer.addSublayer(semiCircleLayer)
    }

    private func addCircleAndSemiCircle(size: CGFloat) {
        configureSemiCircle(semiCircleLayer: semiCircleLayer, size: size)
        semiCircleLayer.add(rotationAnimation(), forKey: Constants.rotationAnimationKey)
        semiCircleLayer.add(springAnimation(), forKey: Constants.springAnimationKey)
        configureCircleBackground(circleLayer: circleLayer, size: size)
        layer.addSublayer(circleLayer)
    }
}
