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
        let fontSize = getComponentAttributeFromTheme(\.tabLabelFontSize)
        let fontWeight = getComponentAttributeFromTheme(\.tabLabelPrimaryFontWeight)
        let fontFamily = getComponentAttributeFromTheme(\.tabLabelPrimaryFontFamily)

        label.font = NatFonts.font(ofSize: fontSize,
                             withWeight: fontWeight,
                             withFamily: fontFamily)
        label.textAlignment = .center
        return label
    }()

    init(title: String) {
        super.init(frame: .zero)
        let lineHeight = getComponentAttributeFromTheme(\.tabLabelLineHeight)
        let letterSpacing = getComponentAttributeFromTheme(\.tabLabelLetterSpacing)
        titleLabel.attributedText = title.uppercased()
            .attributedStringWith(lineHeight: lineHeight,
                                  letterSpacing: letterSpacing)
        titleLabel.textAlignment = .center

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

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: NatSpacing.tiny),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -NatSpacing.tiny),
            self.widthAnchor.constraint(greaterThanOrEqualToConstant: NatSizes.largeX)
        ])
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
