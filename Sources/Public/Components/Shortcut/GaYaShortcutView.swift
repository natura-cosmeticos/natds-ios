public class GaYaShortcutView: UIView {

    private let circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = getTokenFromTheme(\.sizeMediumX) / 2
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let iconView: IconView = {
        let iconView = IconView(fontSize: getTokenFromTheme(\.sizeSemi))
        iconView.translatesAutoresizingMaskIntoConstraints = false

        return iconView
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public convenience init(icon: String? = nil) {
        defer { self.iconView.iconText = icon }
        self.init()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = NatBorderRadius.circle(viewHeight: bounds.height)
    }

    private func setup() {
        circleView.addSubview(iconView)
        addSubview(circleView)

        let circleSize = NatSizes.mediumX

        let constraints = [
            circleView.topAnchor.constraint(equalTo: topAnchor),
            circleView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            circleView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.widthAnchor.constraint(equalToConstant: circleSize),
            circleView.heightAnchor.constraint(equalToConstant: circleSize),

            iconView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemi)),
            iconView.heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemi))
        ]

        NSLayoutConstraint.activate(constraints)
    }

    internal func configure(icon: String?) {
        iconView.iconText = icon
    }

    internal func configure(iconColor color: UIColor) {
        iconView.tintColor = color
    }

    internal func configure(badgeValue: UInt) {
        if badgeValue <= 0 {
            removeBadge()
        } else {
            configure(badgeStyle: .standard, withColor: .alert)
            setBadge(count: Int(badgeValue))
        }
    }
}

extension GaYaShortcutView: Badgeable {}
