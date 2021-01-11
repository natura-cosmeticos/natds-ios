@objcMembers
public class NavigationDrawerItemCell: UITableViewCell {
    public enum State: Int {
        case normal
        case disabled
        case selected
    }

    public var state: State = .normal {
        didSet {
            updateState()
        }
    }

    public var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }

    public var icon: String? = nil {
        didSet {
            iconView.iconText = icon
        }
    }

    public var tagText: String? {
        didSet {
            if let text = tagText {
                tagView.configure(text: text)
            } else {
                tagView.isHidden = true
            }
        }
    }

    var hasSubItems: Bool = false {
        didSet {
            updateState()
            arrowView.isHidden = !hasSubItems
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
        label.font = NatFonts.font(ofSize: .body2)
        return label
    }()

    private lazy var iconView: IconView = {
        let iconView = IconView()
        iconView.tintColor = NatColors.highEmphasis
        return iconView
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
        return tagView
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

}

private extension NavigationDrawerItemCell {

    func setup() {
        selectionStyle = .none
        backgroundColor = .white
        addHighlightSelectedView()
        addIconView()
        addTitleLabel()
        addTagView()
        addArrowImageView()
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
        NSLayoutConstraint.activate([
            tagView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            tagView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8.0)
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

        contentView.alpha = state == .disabled ? 0.48 : 1.0
    }
}
