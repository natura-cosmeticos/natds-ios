public class NavigationDrawerSubmenuItem: UIView {

    public enum State {
        case normal
        case disabled
        case selected
    }

    public var state: State = .normal {
        didSet {
            highlightSelectedView.isHidden = state != .selected
            label.alpha = state == .disabled ? 0.48 : 1.0
        }
    }

    public var text: String? {
        get { return label.text }
        set { label.text = newValue }
    }

    private lazy var verticalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.surfaceDark
        return view
    }()

    private lazy var highlightSelectedView: UIView = {
        let view = UIView()
        view.alpha = 0.16
        view.backgroundColor = Colors.primary
        view.layer.cornerRadius = 4.0
        return view
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = Colors.highEmphasis
        label.font = Fonts.body2
        return label
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        defer { state = .normal }
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension NavigationDrawerSubmenuItem {

    func setup() {
        backgroundColor = .white
        addVerticalLineView()
        addHighlightSelectedView()
        addLabel()
    }

    func addVerticalLineView() {
        addSubview(verticalLineView)
        verticalLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalLineView.topAnchor.constraint(equalTo: topAnchor),
            verticalLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalLineView.widthAnchor.constraint(equalToConstant: 1.0),
            verticalLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0)
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

    func addLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: highlightSelectedView.topAnchor, constant: 12.0),
            label.bottomAnchor.constraint(equalTo: highlightSelectedView.bottomAnchor, constant: -12.0),
            label.leadingAnchor.constraint(equalTo: highlightSelectedView.leadingAnchor, constant: 8.0),
            label.trailingAnchor.constraint(equalTo: highlightSelectedView.trailingAnchor, constant: -8.0)
        ])
    }

}
