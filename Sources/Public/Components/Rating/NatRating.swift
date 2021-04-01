/**
DOCS
 */

public final class NatRating: UIView {

    private var style: Style
    private var state: State = .enabled {
        didSet {
            updateStarViewsState()
            isUserInteractionEnabled = state.isInteractionEnabled
        }
    }
    private var size: Size
    private var alignment: Alignment
    private var ratingValue: Int = 0 {
        didSet {
            updateStarViewsState()
        }
    }
    
    private var starViewsArray: [IconView] = []
    private var touchedStar: IconView {
        return starViewsArray[ratingValue-1]
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

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if style == .input {
            handleTouchAtLocation(withTouches: touches)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if style == .input {
            removePulseLayer(layer: touchedStar.layer)
        }
    }

    private func handleTouchAtLocation(withTouches touches: Set<UITouch>) {
        let touchLocation = touches.first
        let location = touchLocation?.location(in: stackView)

        starViewsArray.enumerated().forEach { (index, iconView) in
            if (location?.x)! > iconView.frame.origin.x {
                ratingValue = index + 1
            }
        }
        addPulseLayerAnimated(at: touchedStar.centerBounds,
                              in: touchedStar.layer,
                              removeAfterAnimation: true)
    }

    // MARK: - Public methods

    public func configure(text: String) {
        hintLabel.text = text
    }

    public func configure(rate: Int) {
        ratingValue = rate
    }

    public func configure(state: State) {
        self.state = state
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
        iconView.layer.cornerRadius = NatBorderRadius.circle(viewHeight: size.value)
        iconView.clipsToBounds = true
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.heightAnchor.constraint(equalToConstant: size.value).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: size.value).isActive = true

        iconView.defaultImageView.image = image
        iconView.isUserInteractionEnabled = true
        return iconView
    }

    private func createStarViews() {
        if style == .counter {
            let iconView = createStarIconView(with: style.filledStarImage(for: state))
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
    
    private func updateStarViewsState() {
        starViewsArray.enumerated().forEach { (index, iconView) in
            if index < ratingValue {
                iconView.defaultImageView.image = style.filledStarImage(for: state)
            } else {
                iconView.defaultImageView.image = style.emptyStarImage
            }
        }
    }
}

// MARK: - Extensions 

extension NatRating: Pulsable {}
