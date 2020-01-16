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
        set { titleLabel.text = newValue }
    }

    private lazy var verticalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.surfaceDark
        return view
    }()

    private lazy var highlightSelectedView: UIView = {
        let view = UIView()
        view.alpha = 0.16
        view.backgroundColor = Colors.secondary
        view.layer.cornerRadius = 4.0
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.highEmphasis
        label.font = Fonts.body2
        return label
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

}

private extension NavigationDrawerSubitemCell {

    func setup() {
        selectionStyle = .none
        backgroundColor = .white
        addVerticalLineView()
        addHighlightSelectedView()
        addTitleLabel()
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
            titleLabel.topAnchor.constraint(equalTo: highlightSelectedView.topAnchor, constant: 12.0),
            titleLabel.bottomAnchor.constraint(equalTo: highlightSelectedView.bottomAnchor, constant: -12.0),
            titleLabel.leadingAnchor.constraint(equalTo: highlightSelectedView.leadingAnchor, constant: 8.0),
            titleLabel.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor, constant: -8.0)
        ])
    }

}
