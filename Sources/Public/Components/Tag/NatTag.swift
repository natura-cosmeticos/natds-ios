/**
  NatTag is a class that represents  a component from the design system.

  The tag colors changes according with the current Brand configured in the Design system
  and according with user properties of Light and Dark mode.

    This component has 1 style:
    - defaultAlert

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
    }

    // MARK: - Private properties

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .caption, withWeight: .regular)
        label.textAlignment = .center
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
    }

    private func addConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -getTokenFromTheme(\.sizeTiny)),
            label.topAnchor.constraint(equalTo: topAnchor, constant: getTokenFromTheme(\.sizeMicro)),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -getTokenFromTheme(\.sizeMicro)),
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
