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

    public var icon: Icon = .outlinedDefaultMockup {
        didSet {
            iconView.icon = icon
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

    private lazy var arrowView: IconView = {
        let iconView = IconView()
        iconView.tintColor = NatColors.highEmphasis
        return iconView
    }()

    private var labelToHighlightConstraint: NSLayoutConstraint?

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        defer {
            state = .normal
            hasSubItems = false
            icon = .outlinedDefaultMockup
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
        let constraint = titleLabel.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor,
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

    func addArrowImageView() {
        contentView.addSubview(arrowView)
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        let constraint = arrowView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8.0)
        constraint.priority = .defaultHigh
        NSLayoutConstraint.activate([
            arrowView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            arrowView.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor, constant: -8.0),
            arrowView.widthAnchor.constraint(equalToConstant: 24.0),
            arrowView.heightAnchor.constraint(equalToConstant: 24.0),
            constraint
        ])
    }

    func updateState() {
        arrowView.icon = state == .selected ? .outlinedNavigationArrowtop : .outlinedNavigationArrowbottom

        highlightSelectedView.isHidden = state != .selected
        highlightSelectedView.backgroundColor = hasSubItems ? NatColors.lowEmphasis : NatColors.secondary

        contentView.alpha = state == .disabled ? 0.48 : 1.0
    }

}
