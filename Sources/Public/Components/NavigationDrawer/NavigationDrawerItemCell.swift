// swiftlint:disable function_body_length
// swiftlint:disable file_length
@objcMembers
public class NavigationDrawerItemCell: UITableViewCell {
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

    public enum NavigationAction {
        case none
        case icon(_ icon: String?)
        case imageUrl(_ url: URL)
        case image(_ image: UIImage?)
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

    enum Side {
        case right
        case left
    }

    public enum NavigationItemType {
        case title
        case menuItem
    }

    public enum NavigationAdd {
        case badge(_ text: String)
        case dot
        case pulse
        case icon(_ icon: String?)
        case none
    }

    public var actionRight: NavigationAction = .none {
        didSet {
            updateAction(.right)
        }
    }
    public var actionLeft: NavigationAction = .none {
        didSet {
            updateAction(.left)
        }
    }

    public var actionTitleRight: NavigationAdd = .none {
        didSet {
            updateTitleAction()
        }
    }

    public var dropdown: Bool = true {
        didSet {
            arrowView.isHidden = !hasSubItems || !dropdown
            labelToHighlightConstraint?.isActive = !hasSubItems || !dropdown
        }
    }

    public var type: NavigationItemType = .menuItem {
        didSet {
            updateTitleLabelType(type)
        }
    }

    public var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }

    public var icon: String? = nil {
        didSet {
            if icon != nil {
                self.actionLeft = .icon(icon)
            } else {
                self.actionLeft = .none
            }
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
            arrowView.isHidden = !hasSubItems || !dropdown
            labelToHighlightConstraint?.isActive = !hasSubItems || !dropdown
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

    internal lazy var leftView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    internal lazy var rightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    internal lazy var titleRightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var arrowView: UIImageView = {
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        iconView.tintedColor = getUIColorFromTokens(\.colorHighEmphasis)

        return iconView
    }()

    private lazy var tagView: NatTag = {
        let tagView = NatTag(style: .defaultAlert)
        tagView.configure(color: .alert)

        return tagView
    }()

    private var labelToHighlightConstraint: NSLayoutConstraint?
    private var titleToLeadingConstraint = NSLayoutConstraint()
    private var titleToLeftViewConstraint = NSLayoutConstraint()

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        defer {
            state = .normal
            hasSubItems = false
            icon = nil
            tagText = nil
            actionLeft = .none
            actionRight = .none
            actionTitleRight = .none
        }
        setup()
    }

    public override func prepareForReuse() {
        state = .normal
        hasSubItems = false
        icon = nil
        tagText = nil
        actionLeft = .none
        actionRight = .none
        actionTitleRight = .none
        type = .menuItem
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NavigationDrawerItemCell {

    func setup() {
        selectionStyle = .none
        backgroundColor = .white
        addHighlightSelectedView()
        addLeftView()
        addTitleLabel()
        addTagView()
        addArrowImageView()
        addRightView()
        addTitleRightView()
    }

    func updateLeftView(hidden: Bool) {
        leftView.isHidden = hidden
        titleToLeadingConstraint.isActive = hidden
        titleToLeftViewConstraint.isActive = !hidden
    }

    func updateAction(_ side: Side) {
        let sideAction = side == .left ? actionLeft : actionRight
        let sideView = side == .left ? leftView : rightView
        let iconColor = side == .left ?
            getUIColorFromTokens(\.colorHighEmphasis) : getUIColorFromTokens(\.colorMediumEmphasis)

        switch sideAction {
        case .none:
            sideView.subviews.forEach { $0.removeFromSuperview() }
            if sideView == leftView { updateLeftView(hidden: true) }
        case .icon(let newIcon):
            sideView.subviews.forEach { $0.removeFromSuperview() }
            let view = IconView(newIcon)
            view.tintColor = iconColor
            sideView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.centerXAnchor.constraint(equalTo: sideView.centerXAnchor).isActive = true
            view.centerYAnchor.constraint(equalTo: sideView.centerYAnchor).isActive = true
            if sideView == leftView { updateLeftView(hidden: false) }
        case .imageUrl(let url):
            sideView.subviews.forEach { $0.removeFromSuperview() }
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            sideView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.leadingAnchor.constraint(equalTo: sideView.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: sideView.trailingAnchor).isActive = true
            view.topAnchor.constraint(equalTo: sideView.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: sideView.bottomAnchor).isActive = true
            view.load(url: url)
            if sideView == leftView { updateLeftView(hidden: false) }
        case .image(let newImage):
            sideView.subviews.forEach { $0.removeFromSuperview() }
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            sideView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.leadingAnchor.constraint(equalTo: sideView.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: sideView.trailingAnchor).isActive = true
            view.topAnchor.constraint(equalTo: sideView.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: sideView.bottomAnchor).isActive = true
            view.image = newImage
            if sideView == leftView { updateLeftView(hidden: false) }
        }
    }

    func updateTitleAction() {
        switch actionTitleRight {
        case .none:
            titleRightView.subviews.forEach { $0.removeFromSuperview() }
            return
        case .dot:
            titleRightView.subviews.forEach { $0.removeFromSuperview() }
            let view = NatBadge(style: .dot, color: .primary)
            titleRightView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.centerXAnchor.constraint(equalTo: titleRightView.centerXAnchor).isActive = true
            view.centerYAnchor.constraint(equalTo: titleRightView.centerYAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: titleRightView.trailingAnchor).isActive = true
        case .pulse:
            titleRightView.subviews.forEach { $0.removeFromSuperview() }
            let view = NatBadge(style: .pulse, color: .primary)
            titleRightView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.leadingAnchor.constraint(equalTo: titleRightView.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: titleRightView.trailingAnchor).isActive = true
            view.topAnchor.constraint(equalTo: titleRightView.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: titleRightView.bottomAnchor).isActive = true
        case .badge(let newText):
            self.tagText = newText
        case .icon(let newIcon):
            guard let newIcon = newIcon else { return }
            titleRightView.subviews.forEach { $0.removeFromSuperview() }
            let view = IconView(fontSize: 16, icon: newIcon)
            view.tintColor = getUIColorFromTokens(\.colorHighEmphasis)
            titleRightView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSmall)).isActive = true
            view.widthAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSmall)).isActive = true
            view.leadingAnchor.constraint(equalTo: titleRightView.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: titleRightView.trailingAnchor).isActive = true
            view.topAnchor.constraint(equalTo: titleRightView.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: titleRightView.bottomAnchor).isActive = true
        }
    }

    func updateTitleLabelType(_ type: NavigationItemType) {
        if type == .menuItem {
            titleLabel.font = NatFonts.font(ofSize: .body2)
        } else {
            titleLabel.font = NatFonts.font(ofSize: .subtitle1)
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
        titleToLeftViewConstraint = titleLabel.leadingAnchor.constraint(equalTo: leftView.trailingAnchor,
                                                                       constant: getTokenFromTheme(\.spacingSmall))
        titleToLeadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: highlightSelectedView.leadingAnchor,
                                                                       constant: 8.0)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: highlightSelectedView.topAnchor, constant: 12.0),
            titleLabel.bottomAnchor.constraint(equalTo: highlightSelectedView.bottomAnchor, constant: -12.0),
            titleLabel.leadingAnchor.constraint(equalTo: leftView.trailingAnchor,
                                                constant: getTokenFromTheme(\.spacingSmall)),
            constraint,
            titleToLeadingConstraint
        ])
        labelToHighlightConstraint = constraint
    }

    func addLeftView() {
        contentView.addSubview(leftView)
        leftView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            leftView.leadingAnchor.constraint(equalTo: highlightSelectedView.leadingAnchor, constant: 8.0),
            leftView.widthAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemi)),
            leftView.heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemi))
        ])
    }

    func addRightView() {
        contentView.addSubview(rightView)
        let constraint = rightView.leadingAnchor.constraint(
            greaterThanOrEqualTo: tagView.trailingAnchor,
            constant: 24.0)
        NSLayoutConstraint.activate([
            rightView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            rightView.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor,
                                                constant: -getTokenFromTheme(\.spacingTiny)),
            rightView.widthAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemi)),
            rightView.heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemi)),
            constraint
        ])
    }

    func addTagView() {
        contentView.addSubview(tagView)
        NSLayoutConstraint.activate([
            tagView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            tagView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor,
                                             constant: getTokenFromTheme(\.spacingTiny))
        ])
    }

    func addTitleRightView() {
        contentView.addSubview(titleRightView)
        NSLayoutConstraint.activate([
            titleRightView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            titleRightView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor,
                                                    constant: getTokenFromTheme(\.spacingTiny)),
            titleRightView.heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemi))
        ])
    }

    func addArrowImageView() {
        contentView.addSubview(arrowView)
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        let constraint = arrowView.leadingAnchor.constraint(
            greaterThanOrEqualTo: tagView.trailingAnchor,
            constant: getTokenFromTheme(\.spacingTiny))
        NSLayoutConstraint.activate([
            arrowView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            arrowView.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor, constant: -8.0),
            arrowView.widthAnchor.constraint(equalToConstant: 24.0),
            arrowView.heightAnchor.constraint(equalToConstant: 24.0),
            constraint
        ])
    }

    func updateState() {
        arrowView.image = state == .selected ?
            AssetsPath.iconOutlinedNavigationArrowTop.rawValue : AssetsPath.iconOutlinedNavigationArrowBottom.rawValue

        highlightSelectedView.isHidden = state != .selected
        highlightSelectedView.backgroundColor = hasSubItems ? NatColors.lowEmphasis : NatColors.secondary

        let shouldShowLowEmphasis = (state == .disabled) || (state == .lowEmphasis)
        contentView.alpha = shouldShowLowEmphasis ? 0.48 : 1.0
    }
}

extension NavigationDrawerItemCell: Pulsable {
    func addRippleAnimation() {
        addPulseLayerAnimated(at: self.highlightSelectedView.center,
                              in: self.highlightSelectedView.layer,
                              withColor: NatColors.highlight.withAlphaComponent(getTokenFromTheme(\.opacityLow)),
                              removeAfterAnimation: true)
    }
}
