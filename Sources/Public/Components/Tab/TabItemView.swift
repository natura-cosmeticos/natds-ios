protocol TabItemViewDelegate: AnyObject {
    func didTapTabItem(_ tabItemView: TabItemView)
}

class TabItemView: UIView {

    enum State {
        case selected
        case normal
    }

    weak var delegate: TabItemViewDelegate?

    var state: State = .normal {
        didSet {
            handleState()
        }
    }

    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.button
        label.textAlignment = .center
        return label
    }()

    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title.uppercased()
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TabItemView {

    private func setup() {
        backgroundColor = .clear

        addLabel()
        handleState()

        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(gesture)
    }

    private func addLabel() {
        addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

extension TabItemView {

    @objc func handleTap() {
        delegate?.didTapTabItem(self)
    }

    private func handleState() {
        switch state {
        case .normal:
            titleLabel.textColor = NatColors.mediumEmphasis
        case .selected:
            titleLabel.textColor = NatColors.highlight
        }
    }
}
