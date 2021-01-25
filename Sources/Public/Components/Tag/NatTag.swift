/**
 NatTag is a class that represents a component from the design system.
 The tag colors change according to the current theme configured to the design system.
 
 These all the available styles for NatTag:
 - defaultAlert
 - leftAlert
 - rightAlert
 
 Example of usage:
 
        let badge = NatTag(style: .defaultAlert)

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public final class NatTag: UIView {
    typealias DrawPath = (_ size: CGSize) -> Void

    enum Position {
        case `default`
        case left
        case right
    }

    // MARK: - Private properties

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .caption, withWeight: .regular)
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultHigh + 1, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let style: Style
    private var drawPath: DrawPath?

    // MARK: - Inits

    public init(style: Style) {
        self.style = style
        super.init(frame: .zero)

        style.applyStyle(self)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setup() {
        backgroundColor = .clear
        addSubview(label)
        addConstraints()
        isHidden = true
    }

    private func addConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -getTokenFromTheme(\.sizeTiny)),
            label.topAnchor.constraint(equalTo: topAnchor, constant: getTokenFromTheme(\.sizeNone)),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -getTokenFromTheme(\.sizeNone)),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: getTokenFromTheme(\.sizeTiny))
        ]

        NSLayoutConstraint.activate(constraints)
    }

    func configure(path color: UIColor, position: Position) {
        drawPath = { size in
            let path: UIBezierPath

            switch position {
            case .default:
                path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size),
                                    cornerRadius: NatBorderRadius.circle(viewHeight: size.height))
            case .left:
                path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size),
                                    byRoundingCorners: [.topLeft, .bottomLeft],
                                    cornerRadii: CGSize(width: NatBorderRadius.circle(viewHeight: size.height),
                                                        height: NatBorderRadius.circle(viewHeight: size.height)))
            case .right:
                path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size),
                                    byRoundingCorners: [.topRight, .bottomRight],
                                    cornerRadii: CGSize(width: NatBorderRadius.circle(viewHeight: size.height),
                                                        height: NatBorderRadius.circle(viewHeight: size.height)))
            }

            color.set()
            path.fill()
        }
    }

    func configure(textColor color: UIColor) {
        label.textColor = color
    }

    // MARK: - Public methods

    override public func draw(_ rect: CGRect) {
        drawPath?(bounds.size)
    }

    public func configure(text: String) {
        label.text = text
        isHidden = text.isEmpty
    }

}
