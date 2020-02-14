import NatDS

typealias DSColor = (name: String, color: UIColor)

class ColorCollectionViewCell: UICollectionViewCell {
    var color: DSColor? {
        didSet {
            colorView.backgroundColor = color?.color
            colorNameLabel.text = color?.name
            colorHexLabel.text = color?.color.hex
        }
    }
    private let colorView = UIView()
    private let colorNameLabel = UILabel()
    private let colorHexLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.body2
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
        stackView.addArrangedSubview(colorView)
        stackView.addArrangedSubview(colorNameLabel)
        stackView.addArrangedSubview(colorHexLabel)
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

private extension UIColor {
    var hex: String {
        let components = cgColor.components
        let red: CGFloat = components?[0] ?? 0.0
        let green: CGFloat = components?[1] ?? 0.0
        let blue: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "#%02lX%02lX%02lX",
                                    lroundf(Float(red * 255)),
                                    lroundf(Float(green * 255)),
                                    lroundf(Float(blue * 255)))
        return hexString
    }
}
