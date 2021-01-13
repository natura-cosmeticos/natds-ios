/**
 NatBadge is a class that represents  a component from the design system.

 The badge colors changes according with the current Brand configured in the Design system
 and according with user properties of Light and Dark mode.

 This component has 1 style:
 - Standard

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
        case .dot:
            path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: bounds.size),
                                cornerRadius: NatBorderRadius.circle(viewHeight: bounds.size.height))
        }

        color.box.set()
        path?.fill()
    }

    public func configure(count: Int) {
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
