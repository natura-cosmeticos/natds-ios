import NatDS

class IconCollectioViewCell: UICollectionViewCell {
    var icon: Icon? {
        didSet {
            iconView.icon = icon
            if let iconCode = icon?.rawValue,
                let iconUnicode = iconCode.unicodeScalars.first {
                let hex = String(format: "%X", iconUnicode.value)
                iconCodeLabel.text = hex
            }
        }
    }
    private let iconView: IconView = {
        let iconView = IconView()
        iconView.tintColor = Colors.Content.highEmphasis
        return iconView
    }()
    private let iconCodeLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.body2
        label.textAlignment = .center
        return label
    }()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(iconCodeLabel)
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
}
