import UIKit

/**
 - NOTE:
 This component is available in the following variants:
 - ✅ Standard

 With the following attribute status:
 - ✅ Label
 - Disabled:
    - ✅ `Subtract`
    - ✅ `Add`
    - ✅ `Both`
 - Size:
    - ✅ `Semi`
    - ✅ `Medium`
 - Interaction state:
    - ✅ `Enabled`
    - ✅ `Press`
 
 NatCounter is a class that represents the counter component from the design system.

 It can be configured with the sizes:
 - Semi (default)
 - Medium

 Example of usage:

            let counter = NatCounter()
            let counter = NatCounter(size: .medium)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

        DesignSystem().configure(with: AvailableTheme)
 */

public final class NatCounter: UIView {

    public typealias CounterChangeValueHandler = (Int) -> Void
    private var counterChangeValueHandler: CounterChangeValueHandler?

    private var numCounter: Int = 0
    private var subtractDisabledSet: Bool = false
    private var addDisabledSet: Bool = false

    let stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.layer.borderColor = NatColors.highEmphasis.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = getTokenFromTheme(\.borderRadiusMedium)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    let numCounterLabelView: UIView = {
        let view = UIView()
        view.addTopBorder(with: NatColors.highEmphasis, andWidth: 0.5)
        view.addBottomBorder(with: NatColors.highEmphasis, andWidth: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let numCounterLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body2, withWeight: .regular)
        label.textColor = getUIColorFromTokens(\.colorHighEmphasis)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .button, withWeight: .medium)
        label.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let subtractView: NatCounterButton = {
        let view = NatCounterButton()
        view.configure(iconLabel: "-")
        view.layer.borderWidth = 0.5
        view.layer.borderColor = NatColors.highEmphasis.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    let addView: NatCounterButton = {
        let view = NatCounterButton()
        view.configure(iconLabel: "+")
        view.layer.borderWidth = 0.5
        view.layer.borderColor = NatColors.highEmphasis.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    internal var size: Size

    // MARK: - Inits

    public init(size: Size = .semi) {
        self.size = size
        super.init(frame: .zero)

        numCounterLabel.text = "\(numCounter)"

        setupButtons()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
    }

    // MARK: - Public methods

    /// Sets the label of NatCounter component
    /// - Parameter label: text always displayed above NatCounter
    public func configure(label: String?) {
        self.label.text = label
    }

    /// Sets the value of NatCounter component
    /// - Parameter value: value selected of NatCounter
    public func setCount(_ value: Int) {
        numCounter = value
        numCounterLabel.text = "\(numCounter)"
        checkLimit()
    }

    /// Sets the handler to listening value changes
    /// - Parameter changeValue: A closure to notify value changes
    ///
    /// Example of usage:
    /// ```
    /// counter.configure { newValue in }
    /// ```
    public func configure(changeValue: @escaping CounterChangeValueHandler) {
        self.counterChangeValueHandler = changeValue
    }

    /// Sets the state of CounterButtons
    /// - Parameter button: An option from CounterButtonType enum: subtract, add or all
    /// - Parameter state: An option from State enum: enabled or disabled
    ///
    /// Example of usage:
    /// ```
    /// counter.configure(button: .add, state: .disabled)
    /// counter.configure(button: .subtract, state: .disabled)
    /// counter.configure(button: .all, state: .disabled)
    /// ```
    public func configure(button: CounterButtonType, state: State) {

        switch state {
        case .enabled:
            switch button {
            case .subtract:
                subtractView.currentState = .enabled
            case .add:
                addView.currentState = .enabled
            case .all:
                subtractView.currentState = .enabled
                addView.currentState = .enabled
            }

        case .disabled:
            switch button {
            case .subtract:
                subtractView.currentState = .disabled
                subtractView.iconLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
                subtractDisabledSet = true
            case .add:
                addView.currentState = .disabled
                addView.iconLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
                addDisabledSet = true
            case .all:
                subtractView.currentState = .disabled
                addView.currentState = .disabled
                subtractView.iconLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
                addView.iconLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
                subtractDisabledSet = true
                addDisabledSet = true
            }
        }
    }

    /// Returns the value of counter
    public func getValue() -> Int {
        return numCounter
    }

    // MARK: - Private methods

    private func setupButtons() {
        let borderRadius = getTokenFromTheme(\.borderRadiusMedium)

        subtractView.configure(height: size.buttonHeight, width: size.buttonWidth)
        addView.configure(height: size.buttonHeight, width: size.buttonWidth)

        subtractView.roundCorners(corners: [.layerMinXMinYCorner, .layerMinXMaxYCorner],
                                  radius: borderRadius,
                                  sizeWidth: size.buttonWidth,
                                  sizeHeight: size.buttonHeight)
        addView.roundCorners(corners: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner],
                             radius: borderRadius,
                             sizeWidth: size.buttonWidth,
                             sizeHeight: size.buttonHeight)

        self.checkLimit()

        subtractView.configure {
            self.numCounter -= 1
            self.numCounterLabel.text = "\(self.numCounter)"
            self.checkLimit()
            self.counterChangeValueHandler?(self.numCounter)
        }

        addView.configure {
            self.numCounter += 1
            self.numCounterLabel.text = "\(self.numCounter)"
            self.checkLimit()
            self.counterChangeValueHandler?(self.numCounter)
        }
    }

    private func checkLimit() {
        if !subtractDisabledSet {
            if numCounter == 0 {
                subtractView.currentState = .disabled
                subtractView.iconLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
            } else if numCounter > 0 {
                subtractView.currentState = .enabled
                subtractView.iconLabel.textColor = getUIColorFromTokens(\.colorHighEmphasis)
            }
        }

        if !addDisabledSet {
            if numCounter == 99 {
                addView.currentState = .disabled
                addView.iconLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)

            } else if numCounter < 99 {
                addView.currentState = .enabled
                addView.iconLabel.textColor = getUIColorFromTokens(\.colorHighEmphasis)
            }
        }
    }

    private func setupConstraints() {
        addSubview(label)
        addSubview(stackViewContainer)

        numCounterLabelView.addSubview(numCounterLabel)
        stackViewContainer.addArrangedSubview(subtractView)
        stackViewContainer.addArrangedSubview(numCounterLabelView)
        stackViewContainer.addArrangedSubview(addView)

        NSLayoutConstraint.activate([
            stackViewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            stackViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor),

            numCounterLabel.centerYAnchor.constraint(equalTo: numCounterLabelView.centerYAnchor),
            numCounterLabel.centerXAnchor.constraint(equalTo: numCounterLabelView.centerXAnchor),

            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

extension UIView {
    func addTopBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }

    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }

    func roundCorners(corners: CACornerMask,
                      radius: CGFloat,
                      sizeWidth: CGFloat,
                      sizeHeight: CGFloat) {
        if #available(iOS 11, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = corners
        } else {
            var cornerMask = UIRectCorner()
            if corners.contains(.layerMinXMinYCorner) {
                cornerMask.insert(.topLeft)
            }
            if corners.contains(.layerMaxXMinYCorner) {
                cornerMask.insert(.topRight)
            }
            if corners.contains(.layerMinXMaxYCorner) {
                cornerMask.insert(.bottomLeft)
            }
            if corners.contains(.layerMaxXMaxYCorner) {
                cornerMask.insert(.bottomRight)
            }
            let path = UIBezierPath(roundedRect: CGRect(origin: .zero,
                                                        size: CGSize(width: sizeWidth,
                                                                     height: sizeHeight)),
                                    byRoundingCorners: cornerMask,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}
