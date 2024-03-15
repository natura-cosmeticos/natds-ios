public class NavigationDrawerSubitemCell: UITableViewCell {

    public enum State {
        case normal
        case disabled
        case selected
    }

    public var state: State = .normal {
        didSet {
            highlightSelectedView.isHidden = state != .selected
            titleLabel.alpha = state == .disabled ? 0.48 : 1.0
        }
    }

    public var title: String? {
        get { return titleLabel.text }
        set {
            let paragraph = NSMutableParagraphStyle()
            paragraph.lineBreakMode = .byTruncatingTail

            // swiftlint:disable line_length
            titleLabel.attributedText = newValue?
                .attributedStringWith(lineHeight: getComponentAttributeFromTheme(\.navigationDrawerSectionItemLineHeight),
                                      letterSpacing: getComponentAttributeFromTheme(\.navigationDrawerSectionItemLetterSpacing),
                                      paragraphStyle: paragraph)
            // swiftlint:enable line_length
        }
    }

    public var leftIcon: String? = nil {
        didSet {
            leftIconView.isHidden = leftIcon == nil
            if leftIcon != nil {
                leftIconView.iconText = leftIcon
                updateTitleConstraints()
            }
        }
    }

    public var rightIcon: String? = nil {
        didSet {
            rightIconView.isHidden = rightIcon == nil
            rightIconView.iconText = rightIcon
        }
    }

    private lazy var verticalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = NatColors.highlight.withAlphaComponent(0.12)
        return view
    }()

    private lazy var highlightSelectedView: UIView = {
        let view = UIView()
        view.alpha = 0.16
        view.backgroundColor = NatColors.secondary
        view.layer.cornerRadius = 4.0
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = NatColors.highEmphasis
        let fontSize = getComponentAttributeFromTheme(\.navigationDrawerSectionItemFontSize)
        let fontWeight = getComponentAttributeFromTheme(\.navigationDrawerSectionItemPrimaryFontWeight)
        let fontFamily = getComponentAttributeFromTheme(\.navigationDrawerSectionItemPrimaryFontFamily)

        label.font = NatFonts.font(ofSize: fontSize,
                             withWeight: fontWeight,
                             withFamily: fontFamily)
        return label
    }()

    private lazy var leftIconView: IconView = {
        let iconView = IconView()
        iconView.tintColor = NatColors.highEmphasis
        return iconView
    }()

    private lazy var rightIconView: IconView = {
        let iconView = IconView()
        iconView.tintColor = NatColors.highEmphasis
        return iconView
    }()

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        defer { state = .normal }
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func prepareForReuse() {
        self.rightIcon = nil
        self.leftIcon = nil
        self.title = nil
    }
}

private extension NavigationDrawerSubitemCell {

    func setup() {
        selectionStyle = .none
        backgroundColor = .white
        addVerticalLineView()
        addHighlightSelectedView()
        addTitleLabel()
        addLeftIconView()
        addRightIconView()
        rightIconView.isHidden = rightIcon == nil
        leftIconView.isHidden = leftIcon == nil
    }

    func addVerticalLineView() {
        addSubview(verticalLineView)
        verticalLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalLineView.topAnchor.constraint(equalTo: topAnchor),
            verticalLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalLineView.widthAnchor.constraint(equalToConstant: 1.0),
            verticalLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 47.0)
        ])
    }

    func addHighlightSelectedView() {
        addSubview(highlightSelectedView)
        highlightSelectedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highlightSelectedView.topAnchor.constraint(equalTo: topAnchor, constant: 4.0),
            highlightSelectedView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4.0),
            highlightSelectedView.leadingAnchor.constraint(equalTo: verticalLineView.trailingAnchor, constant: 8.0),
            highlightSelectedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0)
        ])
    }

    func addTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: highlightSelectedView.topAnchor, constant: 8.0),
            titleLabel.bottomAnchor.constraint(equalTo: highlightSelectedView.bottomAnchor, constant: -8.0),
            titleLabel.leadingAnchor.constraint(equalTo: highlightSelectedView.leadingAnchor, constant: 8.0),
            titleLabel.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor, constant: -8.0)
        ])
    }

    func updateTitleConstraints() {
        if subviews.contains(titleLabel) {
            titleLabel.removeFromSuperview()
        }
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: highlightSelectedView.topAnchor, constant: 12.0),
            titleLabel.bottomAnchor.constraint(equalTo: highlightSelectedView.bottomAnchor, constant: -12.0),
            titleLabel.leadingAnchor.constraint(equalTo: highlightSelectedView.leadingAnchor, constant: 32.0),
            titleLabel.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor, constant: -8.0)
        ])
    }

    func addLeftIconView() {
        contentView.addSubview(leftIconView)
        leftIconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftIconView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            leftIconView.leadingAnchor.constraint(equalTo: verticalLineView.leadingAnchor, constant: 8.0),
            leftIconView.widthAnchor.constraint(equalToConstant: 24.0),
            leftIconView.heightAnchor.constraint(equalToConstant: 24.0)
        ])
    }

    func addRightIconView() {
        contentView.addSubview(rightIconView)
        rightIconView.translatesAutoresizingMaskIntoConstraints = false
        let constraint = rightIconView.leadingAnchor.constraint(
            greaterThanOrEqualTo: titleLabel.trailingAnchor,
            constant: 24.0)
        NSLayoutConstraint.activate([
            rightIconView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            rightIconView.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor, constant: -8.0),
            rightIconView.widthAnchor.constraint(equalToConstant: 24.0),
            rightIconView.heightAnchor.constraint(equalToConstant: 24.0),
            constraint
        ])
    }
}
