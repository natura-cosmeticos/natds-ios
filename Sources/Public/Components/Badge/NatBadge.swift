/**
 This component is available in the following variants:
    - ✅ Standard
    - ✅ Dot
    - ✅ Pulse
 
 With the following attributes:
    - Color:
        - ✅ `Alert`
        - ✅ `Primary`
        - ✅ `Secondary`
        - ✅ `Success`
    - Limit:
        - ✅ `max9`
        - ✅ `max99`
        - ✅ `unlimited`
 
 NatBadge is a class that represents a component from the Design System.
 
 The badge colors change according to the current brand configured in the Design System.
 They also change according to the user's properties of Light and Dark mode.
 
 NatBadge has three variants: `standard`, `dot` and `pulse`.
 It can be configured with colors `alert`, `primary`, `secondary` and `success`.
 
 Example of usage:
 
        let badge = NatBadge(style: .standard, color: .alert)
        badge.configure(limit: .unlimited)
 
 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.
 
        DesignSystem().configure(with: AvailableTheme)
*/

public final class NatBadge: UIView {

    // MARK: - Private properties

    internal var centerCircleLayer = CAShapeLayer()
    internal var backgroundCircleLayer = CAShapeLayer()
    internal var circleLayerContainer = CAShapeLayer()

    private let style: Style
    private let color: Color
    private var value = 0
    private var limit: Limit = .unlimited {
        didSet {
            configure(count: value)
        }
    }

    internal var shouldAppear: Bool {
        return (style != .standard || (style == .standard && value > 0))
    }

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

            drawPulse()
            scaleAnimation()
            opacityAnimation()
            centerCircleLayer.fillColor = color.box.cgColor
            backgroundCircleLayer.fillColor = color.box.withAlphaComponent(getTokenFromTheme(\.opacityMedium)).cgColor
        }
    }

    public func configure(count: Int) {
        value = count
        isHidden = count <= 0

        if count <= 0 {
            label.text = nil
            return
        }

        guard let maxValue = limit.maxValue else {
            label.text = "\(count)"
            return
        }

        if count <= maxValue {
            label.text = "\(count)"
        } else {
            label.text = limit.text
        }
    }

    public func configure(limit: Limit) {
        self.limit = limit
    }
}
