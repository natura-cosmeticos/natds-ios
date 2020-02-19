protocol TabItemViewDelegate: class {
    func didTapTabItemAt(index: Int)
}

class TabItemView: UIView {

    enum State {
        case active
        case normal
    }

    private let index: Int
    private let titleLabel = UILabel()

    private var state: State = .normal {
        didSet {
            handleState()
        }
    }

    weak var delegate: TabItemViewDelegate?

    init(index: Int, title: String) {
        self.index = index
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

    func changeStateBySelectedIndex(_ selectedIndex: Int) {
        state = selectedIndex == index ? .active : .normal
    }
}

extension TabItemView {

    private func setup() {
        backgroundColor = .clear

        titleLabel.font = Fonts.button
        titleLabel.textAlignment = .center

        addLabel()
        handleState()

        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(gesture)
    }

    private func addLabel() {
        addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

extension TabItemView {

    @objc private func handleTap() {
           delegate?.didTapTabItemAt(index: index)
       }

    private func handleState() {
        switch state {
        case .normal:
            titleLabel.textColor = Colors.Content.mediumEmphasis
        case .active:
            titleLabel.textColor = Colors.highlight
        }
    }
}
