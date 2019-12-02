@objcMembers
public class NavigationDrawerItem: UIView {

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

    public var text: String? {
        get { return label.text }
        set { label.text = newValue }
    }

    public var hasSubItems: Bool = false {
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

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = Colors.highEmphasis
        label.font = Fonts.body2
        return label
    }()

    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = OutlinedIcons.Navigation.arrowDown
        imageView.tintColor = Colors.highEmphasis
        return imageView
    }()

    private var labelToHighlightConstraint: NSLayoutConstraint?

    public override init(frame: CGRect) {
        super.init(frame: frame)
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

private extension NavigationDrawerItem {

    func setup() {
        backgroundColor = .white
        addHighlightSelectedView()
        addLabel()
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

    func addLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        let constraint = label.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor, constant: -8.0)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: highlightSelectedView.topAnchor, constant: 12.0),
            label.bottomAnchor.constraint(equalTo: highlightSelectedView.bottomAnchor, constant: -12.0),
            label.leadingAnchor.constraint(equalTo: highlightSelectedView.leadingAnchor, constant: 8.0),
            constraint
        ])
        labelToHighlightConstraint = constraint
    }

    func addArrowImageView() {
        addSubview(arrowImageView)
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        let constraint = arrowImageView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8.0)
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
        highlightSelectedView.isHidden = state != .selected
        highlightSelectedView.backgroundColor = hasSubItems ? Colors.lowEmphasis : Colors.secondary
        alpha = state == .disabled ? 0.48 : 1.0
    }

}
