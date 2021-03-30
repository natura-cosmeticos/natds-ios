/**
 NatBadge is a class that represents a component from the Design System.

 The badge colors change according to the current brand configured in the Design System.
 They also change according to the user's properties of Light and Dark mode.

 This component has 2 styles:
 - Standard
 - Dot

 And 1 color:
 - Alert

 Example of usage:
 
        let badge = NatBadge(style: .standard, color: .alert)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.
 
        DesignSystem().configure(with: AvailableTheme)
 */

public final class NatBadge: UIView {

    // MARK: - Private properties

    private let style: Style

    private let color: Color

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .caption, withWeight: .regular)
        label.textColor = color.content
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Inits

    public init(style: Style, color: Color) {
        self.style = style
        self.color = color
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setup() {
        backgroundColor = .clear
        if case .standard = style {
            addSubview(label)
            addLabelConstraints()
        }

        if case .dot = style {
            addDotConstraints()
        }

        if case .pulse = style {
            addDotConstraints()
        }
    }

    private func addLabelConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func addDotConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            self.widthAnchor.constraint(equalToConstant: 8),
            self.heightAnchor.constraint(equalToConstant: 8)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    // MARK: - Public methods

    override public func draw(_ rect: CGRect) {
        let path: UIBezierPath?

        switch style {
        case .standard:
            path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: bounds.size),
                                cornerRadius: NatBorderRadius.circle(viewHeight: bounds.size.height))
            color.box.set()
            path?.fill()

        case .dot:
            path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: bounds.size),
                                cornerRadius: NatBorderRadius.circle(viewHeight: bounds.size.height))
            color.box.set()
            path?.fill()

        case .pulse:

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
            centerCircleLayer.fillColor = color.box.cgColor
            centerCircleLayer.position = CGPoint(x: circleLayerContainer.bounds.midX, y: circleLayerContainer.bounds.midY)

            backgroundCircleLayer.path = circleBackground.cgPath
            backgroundCircleLayer.position = CGPoint(x: circleLayerContainer.bounds.midX,
                                                     y: circleLayerContainer.bounds.midY)
            backgroundCircleLayer.fillColor = color.box.withAlphaComponent(getTokenFromTheme(\.opacityMedium)).cgColor

            circleLayerContainer.path = circleContainer.cgPath
            circleLayerContainer.position = CGPoint(x: bounds.midX, y: bounds.midY)
            circleLayerContainer.fillColor = UIColor.clear.cgColor

            circleLayerContainer.addSublayer(backgroundCircleLayer)
            layer.addSublayer(circleLayerContainer)
            layer.addSublayer(centerCircleLayer)

            let sacleAnimation = CABasicAnimation(keyPath: "transform.scale")

            sacleAnimation.toValue = 1.5
            sacleAnimation.duration = 0.8
            sacleAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
            sacleAnimation.autoreverses = true
            sacleAnimation.repeatCount = Float.infinity

            backgroundCircleLayer.add(sacleAnimation, forKey: "pulsing")

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

    private var centerCircleLayer = CAShapeLayer()
    private var backgroundCircleLayer = CAShapeLayer()
    private var circleLayerContainer = CAShapeLayer()

    internal func configure(count: Int) {
        var text: String?
        if case .standard = style {
            switch count {
            case ...0:
                break
            case 1...99:
                text = "\(count)"
            default:
                text = "99+"
            }
        }

        label.text = text
        isHidden = text == nil
    }
}
