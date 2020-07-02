public final class NatShortcut: UIView, Pulsable {
    private let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = NatBorderRadius.circle(viewHeight: getTheme().sizes.mediumx)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let iconView: IconView = {
        let iconView = IconView()
        iconView.icon = .outlinedDefaultMockup
        iconView.translatesAutoresizingMaskIntoConstraints = false

        return iconView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .caption, withWeight: .regular)
        label.textColor = getTheme().colors.highEmphasis
        label.text = "Compras & Status"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    public init() {
        super.init(frame: .zero)

        backgroundColor = .red

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        beginPulseAt(point: circleView.center, in: circleView.layer)
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        endPulse(layer: circleView.layer)
    }

    private func setup() {
        circleView.addSubview(iconView)

        addSubview(circleView)
        addSubview(label)

        addConstraints()
    }

    private func addConstraints() {

        let circleSize = getTheme().sizes.mediumx
            let constraints = [
                circleView.topAnchor.constraint(equalTo: topAnchor),
                circleView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
                circleView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
                circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
                circleView.widthAnchor.constraint(equalToConstant: circleSize),
                circleView.heightAnchor.constraint(equalToConstant: circleSize),

                iconView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
                iconView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),

                label.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 8),
                label.trailingAnchor.constraint(equalTo: trailingAnchor),
                label.bottomAnchor.constraint(equalTo: bottomAnchor),
                label.leadingAnchor.constraint(equalTo: leadingAnchor),
                label.widthAnchor.constraint(lessThanOrEqualToConstant: 56),
                label.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]

            NSLayoutConstraint.activate(constraints)
        }
}
