/**
DOCS
 */

public final class NatRating: UIView {

    private var style: Style
    private var size: Size
    private var alignment: Alignment
    private var starViewsArray: [IconView] = []

    private var ratingValue: Int = 0 {
        didSet {
            // TODO: update stars
        }
    }

    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.isUserInteractionEnabled = true
        return stack
    }()

    private lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = style.font
        label.textColor = style.fontColor
        return label
    }()

    // MARK: - Inits

    public init(style: Style, size: Size = .semi, alignment: Alignment = .left) {
        self.style = style
        self.size = size
        self.alignment = alignment
        super.init(frame: .zero)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Touches

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if style == .input {
            handleTouchAtLocation(withTouches: touches)
        }
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if style == .input {
            handleTouchAtLocation(withTouches: touches)
        }
    }

    private func handleTouchAtLocation(withTouches touches: Set<UITouch>) {
        let touchLocation = touches.first
        let location = touchLocation?.location(in: stackView)
        var intRating: Int = 0

        starViewsArray.forEach { (iconView) in
            if (location?.x)! > iconView.frame.origin.x {
                let index = starViewsArray.firstIndex(of: iconView)
                intRating = index! + 1
                ratingValue = Int(intRating)
                iconView.defaultImageView.image = style.filledStarImage
            } else {
                iconView.defaultImageView.image = style.emptyStarImage
            }
        }
    }

    // MARK: - Public methods

    public func configure(text: String) {
        hintLabel.text = text
    }

    public func configure(rate: Int) {
        ratingValue = rate
    }

    public func getValue() -> Int {
        return ratingValue
    }

    // MARK: - Private methods

    private func setup() {
        contentScaleFactor = UIScreen.main.scale
        isUserInteractionEnabled = true
        backgroundColor = .clear

        addSubview(stackView)

        createStarViews()
        addConstraints()
    }

    private func createStarIconView(with image: UIImage?) -> IconView {
        let iconView = IconView(fontSize: size.value)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.heightAnchor.constraint(equalToConstant: size.value).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: size.value).isActive = true

        iconView.defaultImageView.image = image
        iconView.isUserInteractionEnabled = true
        return iconView
    }

    private func createStarViews() {
        if style == .counter {
            let iconView = createStarIconView(with: style.filledStarImage)
            stackView.spacing = getTokenFromTheme(\.spacingMicro)
            if alignment == .left {
                stackView.addArrangedSubview(iconView)
                stackView.addArrangedSubview(hintLabel)
            } else {
                stackView.addArrangedSubview(hintLabel)
                stackView.addArrangedSubview(iconView)
            }
        } else {
            for _ in 0..<5 {
                let iconView = createStarIconView(with: style.emptyStarImage)
                stackView.spacing = .zero
                stackView.addArrangedSubview(iconView)
                starViewsArray.append(iconView)
            }
        }
    }

    private func addConstraints() {
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true

        if style.canShowHint {
            addSubview(hintLabel)
            hintLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            hintLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            hintLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            hintLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor,
                                           constant: getTokenFromTheme(\.spacingMicro)).isActive = true
        } else {
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
    }
}
