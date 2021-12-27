@objcMembers
public class NavigationDrawerItemCell: UITableViewCell, Pulsable {
    public enum State: Int {
        case normal
        case disabled
        case selected
        case lowEmphasis
    }

    public var state: State = .normal {
        didSet {
            updateState()
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

    public var icon: String? = nil {
        didSet {
            iconView.iconText = icon
        }
    }

    public var rightIcon: String? = nil {
        didSet {
            rightIconView.isHidden = rightIcon == nil
            rightIconView.iconText = rightIcon
        }
    }

    public var titleIcon: String? = nil {
        didSet {
            titleIconView.iconText = titleIcon
        }
    }

    public var dropdown: Bool = false {
        didSet {
            updateDropdown()
        }
    }

    public var tagText: String? {
        didSet {
            if let text = tagText {
                tagView.setNeedsDisplay()
                tagView.configure(text: text)
                tagView.isHidden = false
            } else {
                tagView.isHidden = true
            }
        }
    }

    var hasSubItems: Bool = false {
        didSet {
            updateState()
            labelToHighlightConstraint?.isActive = !hasSubItems
        }
    }

    private lazy var highlightSelectedView: UIView = {
        let view = UIView()
        view.alpha = 0.16
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

    private lazy var iconView: IconView = {
        let iconView = IconView()
        iconView.tintColor = NatColors.highEmphasis
        return iconView
    }()

    private lazy var rightIconView: IconView = {
        let iconView = IconView()
        iconView.tintColor = NatColors.highEmphasis
        return iconView
    }()

    private lazy var dropdownView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 12).isActive = true
        view.widthAnchor.constraint(equalToConstant: 12).isActive = true
        view.tintedColor = getUIColorFromTokens(\.colorHighEmphasis)
        return view
    }()

    private lazy var tagView: NatTag = {
        let tagView = NatTag(style: .defaultAlert)
        tagView.configure(color: .alert)

        return tagView
    }()

    private lazy var badgeView: NatBadge = {
        let badgeView = NatBadge(style: .dot, color: .primary)

        return badgeView
    }()

    private lazy var titleIconView: IconView = {
        let iconView = IconView()
        iconView.setFontSize(size: getTokenFromTheme(\.sizeSmall))
        iconView.tintColor = NatColors.highEmphasis
        return iconView
    }()

    private var labelToHighlightConstraint: NSLayoutConstraint?

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        defer {
            state = .normal
            hasSubItems = false
            icon = nil
            tagText = nil
        }
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func prepareForReuse() {
        rightIcon = nil
        title = nil
        state = .normal
        hasSubItems = false
        icon = nil
        tagText = nil
    }
}

public extension NavigationDrawerItemCell {
    func addBadgeDot() {
        clearTitleViews()
        self.badgeView = NatBadge(style: .dot, color: .primary)
        addBadgeView()
    }

    func addBadgePulse() {
        clearTitleViews()
        self.badgeView = NatBadge(style: .pulse, color: .primary)
        addBadgeView()
    }

    func addBadge(text: String) {
        clearTitleViews()
        self.tagText = text
        addTagView()
    }

    func addIconToTitle(_ icon: String?) {
        clearTitleViews()
        self.titleIcon = icon
        addTitleIconView()
    }
}

internal extension NavigationDrawerItemCell {
    func addRippleAnimation() {
        addPulseLayerAnimated(at: self.highlightSelectedView.center,
                              in: self.highlightSelectedView.layer,
                              withColor: NatColors.highlight.withAlphaComponent(getTokenFromTheme(\.opacityLow)),
                              removeAfterAnimation: true)
    }
}

private extension NavigationDrawerItemCell {
    func setup() {
        selectionStyle = .none
        backgroundColor = .white
        addHighlightSelectedView()
        addIconView()
        addTitleLabel()
        addTagView()
        addRightIconView()
    }

    func clearTitleViews() {
        if contentView.subviews.contains(tagView) { tagView.removeFromSuperview() }
        if contentView.subviews.contains(badgeView) { badgeView.removeFromSuperview() }
        if contentView.subviews.contains(titleIconView) { titleIconView.removeFromSuperview() }
    }

    func updateDropdown() {
        if dropdown {
            contentView.addSubview(dropdownView)
            let constraint = dropdownView.leadingAnchor.constraint(
                greaterThanOrEqualTo: tagView.trailingAnchor,
                constant: getTokenFromTheme(\.spacingTiny))
            NSLayoutConstraint.activate([
                dropdownView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
                dropdownView.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor, constant: -14.0),
                dropdownView.widthAnchor.constraint(equalToConstant: 24.0),
                dropdownView.heightAnchor.constraint(equalToConstant: 24.0),
                constraint
            ])
        } else {
            if contentView.subviews.contains(dropdownView) { dropdownView.removeFromSuperview() }
        }
    }

    func addHighlightSelectedView() {
        contentView.addSubview(highlightSelectedView)
        highlightSelectedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highlightSelectedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4.0),
            highlightSelectedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4.0),
            highlightSelectedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            highlightSelectedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0)
        ])
    }

    func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraint = titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: highlightSelectedView.trailingAnchor,
                                                              constant: -8.0)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: highlightSelectedView.topAnchor, constant: 12.0),
            titleLabel.bottomAnchor.constraint(equalTo: highlightSelectedView.bottomAnchor, constant: -12.0),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 24.0),
            constraint
        ])
        labelToHighlightConstraint = constraint
    }

    func addIconView() {
        contentView.addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: highlightSelectedView.leadingAnchor, constant: 8.0),
            iconView.widthAnchor.constraint(equalToConstant: 24.0),
            iconView.heightAnchor.constraint(equalToConstant: 24.0)
        ])
    }

    func addTagView() {
        contentView.addSubview(tagView)
        tagView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            tagView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8.0)
        ])
    }

    func addBadgeView() {
        contentView.addSubview(badgeView)
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            badgeView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            badgeView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8.0)
        ])
    }

    func addTitleIconView() {
        contentView.addSubview(titleIconView)
        titleIconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleIconView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            titleIconView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8.0),
            titleIconView.heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSmall)),
            titleIconView.widthAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSmall))
        ])
    }

    func addRightIconView() {
        contentView.addSubview(rightIconView)
        rightIconView.translatesAutoresizingMaskIntoConstraints = false
        let constraint = rightIconView.leadingAnchor.constraint(
            greaterThanOrEqualTo: tagView.trailingAnchor,
            constant: 24.0)
        NSLayoutConstraint.activate([
            rightIconView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            rightIconView.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor, constant: -8.0),
            rightIconView.widthAnchor.constraint(equalToConstant: 24.0),
            rightIconView.heightAnchor.constraint(equalToConstant: 24.0),
            constraint
        ])
        rightIconView.isHidden = true
    }

    func updateState() {
        dropdownView.image = state == .selected ?
                    AssetsPath.iconOutlinedNavigationArrowTop.rawValue :
            AssetsPath.iconOutlinedNavigationArrowBottom.rawValue

        highlightSelectedView.isHidden = state != .selected
        highlightSelectedView.backgroundColor = NatColors.primary
        highlightSelectedView.alpha = getTokenFromTheme(\.opacityMediumLow)

        let shouldShowLowEmphasis = (state == .disabled) || (state == .lowEmphasis)
        contentView.alpha = shouldShowLowEmphasis ? 0.48 : 1.0
    }
}
