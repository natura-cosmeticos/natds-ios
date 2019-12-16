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

    public var expandedIcon: UIImage? = OutlinedIcons.Navigation.arrowUp
    public var collapsedIcon: UIImage? = OutlinedIcons.Navigation.arrowDown

    var hasSubItems: Bool = false {
        didSet {
            updateState()
            arrowImageView.isHidden = !hasSubItems
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
        label.textColor = Colors.highEmphasis
        label.font = Fonts.body2
        return label
    }()

    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Colors.highEmphasis
        return imageView
    }()

    private var labelToHighlightConstraint: NSLayoutConstraint?

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        defer {
            state = .normal
            hasSubItems = false
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
        addTitleLabel()
        addArrowImageView()
    }

    func addHighlightSelectedView() {
        addSubview(highlightSelectedView)
        highlightSelectedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highlightSelectedView.topAnchor.constraint(equalTo: topAnchor, constant: 4.0),
            highlightSelectedView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4.0),
            highlightSelectedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            highlightSelectedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0)
        ])
    }

    func addTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraint = titleLabel.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor,
                                                              constant: -8.0)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: highlightSelectedView.topAnchor, constant: 12.0),
            titleLabel.bottomAnchor.constraint(equalTo: highlightSelectedView.bottomAnchor, constant: -12.0),
            titleLabel.leadingAnchor.constraint(equalTo: highlightSelectedView.leadingAnchor, constant: 8.0),
            constraint
        ])
        labelToHighlightConstraint = constraint
    }

    func addArrowImageView() {
        addSubview(arrowImageView)
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        let constraint = arrowImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8.0)
        constraint.priority = .defaultHigh
        NSLayoutConstraint.activate([
            arrowImageView.centerYAnchor.constraint(equalTo: highlightSelectedView.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor, constant: -8.0),
            arrowImageView.widthAnchor.constraint(equalToConstant: 24.0),
            arrowImageView.heightAnchor.constraint(equalToConstant: 24.0),
            constraint
        ])
    }

    func updateState() {
        arrowImageView.image = state == .selected ? expandedIcon : collapsedIcon

        highlightSelectedView.isHidden = state != .selected
        highlightSelectedView.backgroundColor = hasSubItems ? Colors.lowEmphasis : Colors.secondary

        alpha = state == .disabled ? 0.48 : 1.0
    }

}
