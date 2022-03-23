/**
 NatProgressIndicatorCircular is a class that represents progress indicator circular component from the Design System.
 The component colors changes according to the current theme configured in the Design System.
 
 The size and background can be set at `init()`. The component is already animating when it appears on the screen.
 
 The component has 2 actions:
    - `startAnimation()`, which shows the animated progress indicator
    - `stopAnimation()`, which hides the progress indicator
 
 Example of usage:
            
            let progressIndicator = NatProgressIndicator(size: .semi, backgroundLayer: true)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.
 
        DesignSystem().configure(with: AvailableTheme)
 */

public class NatProgressIndicatorCircular: UIView {

    public enum Action {
        case showAndStartAnimation
        case hideAndStopAnimation
    }

    // MARK: - Private properties

    private var circleLineLayer = CAShapeLayer()
    internal var backgroundLayer = CAShapeLayer()

    private var size: Size = .medium {
        didSet {
            self.setNeedsLayout()
        }
    }

    private var hasBackgroundLayer: Bool = false {
        didSet {
            backgroundLayerColor = hasBackgroundLayer ? getUIColorFromTokens(\.colorSurface) : UIColor.clear
        }
    }

    private var backgroundLayerColor: UIColor = .clear {
        didSet {
            backgroundLayer.fillColor = backgroundLayerColor.cgColor
            self.setNeedsLayout()
        }
    }

    // MARK: - Inits

    public init(size: NatProgressIndicatorCircular.Size = .medium, backgroundLayer: Bool = false) {
        super.init(frame: .zero)
        self.size = size
        self.hasBackgroundLayer = backgroundLayer

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    /// Starts the circle animation
    public func startAnimation() {
        isHidden = false
        startAnimating()
    }

    /// Stops the circle animation and hides the progress indicator
    public func stopAnimation() {
        isHidden = true
        circleLineLayer.removeAllAnimations()
    }

    /// Sets a background layer for the component
    /// - Parameter useBackgroundLayer: a boolean that indicates if the component should have a background layer
    public func configure(useBackgroundLayer: Bool) {
        hasBackgroundLayer = useBackgroundLayer
    }

    @available(*, deprecated, message: "Set the component size at init and use startAnimation() and stopAnimation()")
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

    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.value + NatSizes.small).isActive = true
        heightAnchor.constraint(equalToConstant: size.value + NatSizes.small).isActive = true
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

    // MARK: - Private shape configuration methods

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
        circleLayer.fillColor = backgroundLayerColor.cgColor
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
