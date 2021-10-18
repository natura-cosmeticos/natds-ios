import UIKit
/**
 NatProgressIndicatorCircular is a class that represents progress indicator circular component from the Design System.
 The component colors changes according to the current theme configured in the Design System.

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

    private var circleLineLayer = CAShapeLayer()
    private var backgroundLayer = CAShapeLayer()
    private var size: Size = .medium {
        didSet {
            self.setNeedsLayout()
        }
    }

    // MARK: - Inits

    public init(size: NatProgressIndicatorCircular.Size = .medium) {
        super.init(frame: .zero)
        self.size = size
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    public func configure(with action: Action, size: NatProgressIndicatorCircular.Size = .medium) {
        self.size = size

        switch action {
        case .showAndStartAnimation:
            isHidden = false
            startAnimating()
        case .hideAndStopAnimation:
            isHidden = true
            circleLineLayer.removeAllAnimations()
        }
    }

    public func configure(useBackgroundLayer: Bool) {
        backgroundLayer.fillColor = useBackgroundLayer ?
            getUIColorFromTokens(\.colorSurface).cgColor : UIColor.clear.cgColor
    }

    // MARK: - Overrides

    override public func layoutSubviews() {
        super.layoutSubviews()

        setup()
        startAnimating()
    }

    // MARK: - Private methods

    private func setup() {
        clipsToBounds = true
        setupBackground()
        setupProgressIndicatorCircleLine()
    }

    private func setupBackground() {
        configureCircleBackground(circleLayer: backgroundLayer)
        layer.addSublayer(backgroundLayer)
    }

    private func setupProgressIndicatorCircleLine() {
        configureSemiCircle(semiCircleLayer: circleLineLayer)
    }

    private func startAnimating() {
        circleLineLayer.add(rotationAnimation(), forKey: Constants.rotationAnimationKey)
        circleLineLayer.add(springAnimation(), forKey: Constants.springAnimationKey)
    }

    // MARK: - Path configs

    private func configureSemiCircle(semiCircleLayer: CAShapeLayer) {
        semiCircleLayer.path = createCirclePath(size: size.value).cgPath
        semiCircleLayer.strokeColor = getUIColorFromTokens(\.colorPrimary).cgColor
        semiCircleLayer.fillColor = .none
        semiCircleLayer.lineWidth = getTokenFromTheme(\.sizeMicro)
        semiCircleLayer.position = CGPoint(x: backgroundLayer.bounds.midX, y: backgroundLayer.bounds.midY)
    }

    private func configureCircleBackground(circleLayer: CAShapeLayer) {
        circleLayer.path = createCircleBackground(size: size.value).cgPath
        circleLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        circleLayer.addSublayer(circleLineLayer)
        circleLayer.fillColor = UIColor.clear.cgColor
    }

    private func createCircleBackground(size: CGFloat) -> UIBezierPath {
        let circleBackground = UIBezierPath(
            arcCenter: CGPoint(x: backgroundLayer.bounds.midX, y: backgroundLayer.bounds.midY),
            radius: CGFloat(size/2 + getTokenFromTheme(\.sizeMicro)),
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi * 3),
            clockwise: true)

        return circleBackground
    }

    private func createCirclePath(size: CGFloat) -> UIBezierPath {
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: backgroundLayer.bounds.midX, y: backgroundLayer.bounds.midY),
            radius: CGFloat(size/2),
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true)

        return circlePath
    }
}
