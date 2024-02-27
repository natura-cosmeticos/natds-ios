import NatDS

class IconCollectionViewCell: UICollectionViewCell {
    var icon: String? {
        didSet {
            iconView.iconText = icon
        }
    }

    var iconName: String? {
        didSet {
            nameLabel.text = iconName
        }
    }

    private let iconView: IconView = {
        let iconView = IconView()
        iconView.tintColor = NatColors.highEmphasis
        iconView.setFontSize(size: 34)
        return iconView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.tiny
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(nameLabel)

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
}
