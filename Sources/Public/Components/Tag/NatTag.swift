/**
 - NOTE:
 This component is available in the following variants:
 - ✅ Standard

 With the following attribute status:
 - Position:
    - ✅ `Center`
    - ✅ `Left`
    - ✅ `Right`
 - Color:
    - ✅ `Primary`
    - ✅ `Secondary`
    - ✅ `Success`
    - ✅ `Alert`
    - ✅ `Warning`
    - ✅ `Link`
 - Size:
    - ✅ `Small`
    - ✅ `Standard`
 
 NatTag is a class that represents the tag component from the design system.
 The tag colors change according to the current theme configured.
 
 These all the available styles for a NatTag:
 - defaultAlert
 - leftAlert
 - rightAlert
 
 Example of usage:
 
        let tag = NatTag(style: .defaultAlert)
 
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

    internal lazy var label: UILabel = {
        let label = UILabel()
        let fontSize = getComponentAttributeFromTheme(\.tagLabelFontSize)
        let fontWeight = getComponentAttributeFromTheme(\.tagLabelPrimaryFontWeight)
        let fontFamily = getComponentAttributeFromTheme(\.tagLabelPrimaryFontFamily)

        label.font = NatFonts.font(ofSize: fontSize,
                                   withWeight: fontWeight,
                                   withFamily: fontFamily)

        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultHigh + 1, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let style: Style
    private var drawPath: DrawPath?
    internal var tagColor: Color = .primary

    // MARK: - Inits

    public init(style: Style) {
        self.style = style
        super.init(frame: .zero)
        self.contentScaleFactor = UIScreen.main.scale

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
                                    byRoundingCorners: [.topRight, .bottomRight],
                                    cornerRadii: CGSize(width: NatBorderRadius.circle(viewHeight: size.height),
                                                        height: NatBorderRadius.circle(viewHeight: size.height)))
            case .right:
                path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size),
                                    byRoundingCorners: [.topLeft, .bottomLeft],
                                    cornerRadii: CGSize(width: NatBorderRadius.circle(viewHeight: size.height),
                                                        height: NatBorderRadius.circle(viewHeight: size.height)))
            }

            self.tagColor.tag.set()
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

    /// Configures a text for the component's label. The tag adjusts its width to match the text length.
    public func configure(text: String) {
        // swiftlint:disable line_length
        label.attributedText = text.attributedStringWith(lineHeight: getComponentAttributeFromTheme(\.tagLabelLineHeight),
                                                         letterSpacing: getComponentAttributeFromTheme(\.tagLabelLetterSpacing))
        label.textAlignment = .center
        isHidden = text.isEmpty
    }

    /// Configures a size to the component, which changes the tag's height and padding.
    public func configure(size: Size = .small) {
        heightAnchor.constraint(equalToConstant: size.value).isActive = true
    }

    /// Configures a color for the component's background.
    public func configure(color: Color = .primary) {
        tagColor = color
        configure(textColor: color.label)
    }
}
