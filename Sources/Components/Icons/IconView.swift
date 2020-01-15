class IconView: UIView {

    var icon: Icon? {
        didSet {
            iconLabel.text = icon?.rawValue
        }
    }

    private lazy var iconLabel: UILabel = {
        let label = UILabel()
        label.font = .iconFont()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()
        iconLabel.textColor = tintColor
    }

    private func setup() {
        addSubview(iconLabel)
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconLabel.topAnchor.constraint(equalTo: topAnchor),
            iconLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
