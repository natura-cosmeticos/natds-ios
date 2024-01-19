/**
 - NOTE:
 This component is available in the following variants:
 - ✅ Counter
 - ✅ Input
 - ✅ Read-only

 With the following attribute status:
 - Hint ✅
 - Size:
    - ✅ `Small`
    - ✅ `Standard`
    - ✅ `Semi`
    - ✅ `SemiX`
    - ✅ `Medium`
 - Alignment:
    - ✅ `Right`
    - ✅ `Left`
 - ✅ Disabled
 - ✅ Rate
 - Interaction state:
    - ✅ `Enabled`
    - ✅ `Press`
 
 NatRating is a class that represent the rating component from the design system.
 The colors are default and doesn't change according to the current theme configured.
 
 The component has three different variants, represented by the enum Style:
 - Input
 - Counter
 - Read-only
 
 > Note: the style should be set at `init()`.
 
 There are five different sizes for the rating stars:
 - Small
 - Standard
 - Semi
 - SemiX (default)
 - Medium

 > Note: the size can only be changed at `init()`.
 The sizes `small` and `standard` should only be used with `counter` and `readOnly` variants.
 
 > Note: For the variant `Counter`, the alignment can be `right` or `left` (default).
 The aligment should be set at `init()`.
 
 Example of usage:
        
        let rating = NatRating(style: .input, size: .medium)
        rating.configure(text: "Placeholder")

        let rating = NatRating(style: .counter, alignment: .right)
        rating.configure(text: "Placeholder")
 
        let rating = NatRating(style: .readOnly)
        rating.configure(rate: 3)

 - Requires:
    It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
 */

public final class NatRating: UIView {

    public typealias RatingValueHandler = (Double) -> Void
    private var ratingValueHandler: RatingValueHandler?

    private var style: Style
    private var state: State = .enabled {
        didSet {
            updateStarViewsState()
            handleInteractionState()
        }
    }

    private var size: Size
    private var alignment: Alignment
    private var value: Double = 0.0 {
        didSet {
            updateStarViewsState()
            ratingValueHandler?(value)
        }
    }
    
    private var showQuantity: Bool = true

    private var starViewsArray: [IconView] = []
    private var touchedStar: IconView {
        let index = Int(floor(value)) - 1
        return starViewsArray[max(0, index)]
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
    
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = style.font
        label.textColor = style.fontColorQuantity
        return label
    }()

    // MARK: - Inits

    public init(style: Style, size: Size = .semi, alignment: Alignment = .left, showQuantity:Bool = true) {
        self.style = style
        self.size = size
        self.alignment = alignment
        self.showQuantity = showQuantity
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
            getValueFromTouchAtLocation(withTouches: touches)

            addPulseLayerAnimated(at: touchedStar.centerBounds,
                                  in: touchedStar.layer,
                                  withColor: getUIColorFromTokens(\.colorHighEmphasis)
                                    .withAlphaComponent(getTokenFromTheme(\.opacityLow)),
                                  removeAfterAnimation: true)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if style == .input {
            removePulseLayer(layer: touchedStar.layer)
        }
    }

    private func getValueFromTouchAtLocation(withTouches touches: Set<UITouch>) {
        guard let touchLocation = touches.first?.location(in: stackView) else { return }

        var newValue: Double = 0
        for (index, iconView) in starViewsArray.enumerated() {
            let iconFrame = iconView.frame
            if touchLocation.x > iconFrame.minX {
                newValue = Double(index) + 1
                if style != .input && touchLocation.x < iconFrame.midX {
                    newValue = Double(index) + 0.5
                }
            }
        }
        self.value = newValue
    }


    // MARK: - Public methods

    /// Sets the text for the hint label (if style is input) or description label (if style is counter).
    /// Note: for counter ratings, if the text isn't set, the component will only display a single colored star.
    ///
    /// - Parameter text: a String with the text to be displayed
    public func configure(text: String, quantityText:String = "") {
        hintLabel.attributedText = text.attributedStringWith(lineHeight: style.lineHeight,
            letterSpacing: style.letterSpacing)
        quantityLabel.attributedText = quantityText.attributedStringWith(lineHeight: style.lineHeight, letterSpacing: style.letterSpacing)
    }

    /// Sets the rate value to be shown as colored stars in the component.
    /// Useful for disabled inputs and readOnly variants.
    ///
    /// - Parameter rate: an Int with range from 0 to 5
    public func configure(rate: Double) {
        if style != .counter {
            if (style == .input) {
                value = Double(Int(floor(rate)))
            }
            else {
                value = rate
            }
        }
    }

    /// Sets the state for the component.
    /// If it's disabled, the visual style for input variant will be changed.
    ///
    /// - Parameter state: an option from `State` enum
    public func configure(state: State) {
        self.state = state
    }

    /// Sets the handler to be executed when the value changes
    /// - Parameter valueHandler: A closure to notify value change
    ///
    /// Example of usage:
    /// ```
    /// rating.configure { newValue in }
    /// ```
    public func configure(valueHandler: @escaping RatingValueHandler) {
        self.ratingValueHandler = valueHandler
    }

    /// A function to get the input value from the used
    ///
    /// - Returns: an Int representing the selected value; range from 1 to 5
    public func getValue() -> Double {
        return value
    }

    // MARK: - Private methods

    private func setup() {
        contentScaleFactor = UIScreen.main.scale
        isUserInteractionEnabled = true
        backgroundColor = .clear

        addSubview(stackView)

        createStarViews()
        if (style.canShowQuantity) {
            addConstraintsCounter()
        }
        else {
            addConstraints()
        }
        
        handleInteractionState()
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
                if showQuantity {
                    stackView.addArrangedSubview(quantityLabel)
                }
            } else {
                stackView.addArrangedSubview(hintLabel)
                if showQuantity {
                    stackView.addArrangedSubview(quantityLabel)
                }
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

    private func addConstraintsCounter() {
        // Restrições para o stackView
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        let stackViewBottomConstraint = stackView.bottomAnchor.constraint(equalTo: bottomAnchor)

       // Ativa a restrição de fundo do stackView
        stackViewBottomConstraint.isActive = true
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
        for (index, iconView) in starViewsArray.enumerated() {
            if Double(index) + 0.5 == value {
                iconView.defaultImageView.image = style.semiFilledStarImage(for: state)
            } else if Double(index) < value {
                iconView.defaultImageView.image = style.filledStarImage(for: state)
            } else {
                iconView.defaultImageView.image = style.emptyStarImage
            }
        }
    }


    private func handleInteractionState() {
        if style == .input {
            isUserInteractionEnabled = state.isInteractionEnabled
        } else {
            isUserInteractionEnabled = false
        }
    }
}

// MARK: - Extensions 

extension NatRating: Pulsable {}
