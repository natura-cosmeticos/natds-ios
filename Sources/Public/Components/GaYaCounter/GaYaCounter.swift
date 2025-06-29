//
//  GaYaCounter.swift
//  GaYaDS
//
//  Created by Hayna.Cardoso on 12/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

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
 
 GaYaCounter is a class that represents the counter component from the design system.

 It can be configured with the sizes:
 - Semi (default)
 - Medium

 Example of usage:

            let counter = GaYaCounter()
            let counter = GaYaCounter(size: .medium)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

        DesignSystem().configure(with: AvailableTheme)
 */

public final class GaYaCounter: UIView, UITextFieldDelegate {

    public typealias CounterChangeValueHandler = (Int) -> Void
    private var counterChangeValueHandler: CounterChangeValueHandler?

    private var minCount: Int = 0
    private var maxCount: Int = 999

    private var numCounter: Int = 0 {
        didSet {
            let lineHeight = getComponentAttributeFromTheme(\.counterContentLineHeight)
            let letterSpacing = getComponentAttributeFromTheme(\.counterContentLetterSpacing)

            numCounterTextField.attributedText = "\(numCounter)".attributedStringWith(lineHeight: lineHeight,
                                                                                      letterSpacing: 0.48)
            numCounterTextField.textAlignment = .center
            checkLimit()
        }
    }

    private var didSetSubtractDisabled: Bool = false
    private var didSetAddDisabled: Bool = false

    private let stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.layer.borderColor = GaYaColors.highEmphasis.cgColor
        stackView.layer.borderWidth = 0.8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let numCounterLabelView: UIView = {
        let view = UIView()
        view.addBorder(with: GaYaColors.highEmphasis, andWidth: 0.5, atTop: true)
        view.addBorder(with: GaYaColors.highEmphasis, andWidth: 0.5, atTop: false)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    let numCounterTextField: UITextField = {
        let textField = UITextField()
        
        textField.font = GaYaFonts.font(ofSize: getComponentAttributeFromTheme(\.counterContentFontSize),
                                       withWeight: getComponentAttributeFromTheme(\.counterContentPrimaryFontWeight),
                                       withFamily: getComponentAttributeFromTheme(\.counterContentPrimaryFontFamily))
        textField.textColor = getUIColorFromTokens(\.colorHighEmphasis)
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
                
        let toolbar = UIToolbar()
                toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(doneButtonAction))
        toolbar.items = [flexibleSpace, doneButton]
        
        textField.inputAccessoryView = toolbar
        textField.resignFirstResponder()

        return textField
    }()
    
    @objc func doneButtonAction() {
        numCounterTextField.resignFirstResponder()
        if let text = numCounterTextField.text, let number = Int(text) {
            numCounter = number
        } else {
            numCounter = minCount
        }
        counterChangeValueHandler?(numCounter)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        if let number = Int(updatedText) {
            return number >= minCount && number <= maxCount
        } else if updatedText.isEmpty {
            return true
        }

        return false
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            textField.text = String(minCount)
            numCounter = minCount
        }
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, let number = Int(text) {
            numCounter = number
        }
    }

    var label: UILabel = {
        let label = UILabel()
        label.font = GaYaFonts.font(ofSize: getComponentAttributeFromTheme(\.counterLabelFontSize),
                                   withWeight: getComponentAttributeFromTheme(\.counterLabelPrimaryFontWeight),
                                   withFamily: getComponentAttributeFromTheme(\.counterLabelPrimaryFontFamily))
        label.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let subtractView: GaYaCounterButton = {
        let view = GaYaCounterButton()
        
        let minusView = UIImageView()
        minusView.image = AssetsPath.iconOutlinedActionSubtract.rawValue
        minusView.translatesAutoresizingMaskIntoConstraints = false
        
        view.iconButton.image = minusView.image
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    let addView: GaYaCounterButton = {
        let view = GaYaCounterButton()
        
        let plusView = UIImageView()
        plusView.image = AssetsPath.iconOutlinedActionAdd.rawValue
        plusView.translatesAutoresizingMaskIntoConstraints = false
        
        view.iconButton.image = plusView.image
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private var size: Size
    private var minValue: MinValue

    // MARK: - Inits

    public init(size: Size = .semi, minimumValue: MinValue = .value0) {
        self.size = size
        self.minValue = minimumValue
        super.init(frame: .zero)
        
        if self.minValue == .value1 {
            minCount = 1
        }

        numCounterTextField.delegate = self
        numCounterTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        setCount(minCount)
        setupButtons()
        setupConstraints()
        setupView()
    }
    
    private func setupView() {
        stackViewContainer.layer.cornerRadius = size.borderRadius
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    /// Sets the label of GaYaCounter component
    /// - Parameter label: text always displayed above GaYaCounter
    public func configure(label: String?) {
        let lineHeight = getComponentAttributeFromTheme(\.counterLabelLineHeight)
        let letterSpacing = getComponentAttributeFromTheme(\.counterLabelLetterSpacing)
        self.label.attributedText = label?.attributedStringWith(lineHeight: lineHeight,
                                                                letterSpacing: letterSpacing)
    }

    /// Sets the value of GaYaCounter component
    /// - Parameter value: value for GaYaCounter
    public func setCount(_ value: Int) {
        numCounter = value
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
                subtractView.isEnabled = true
            case .add:
                addView.isEnabled = true
            case .all:
                subtractView.isEnabled = true
                addView.isEnabled = true
            }

        case .disabled:
            switch button {
            case .subtract:
                subtractView.isEnabled = false
                didSetSubtractDisabled = true
            case .add:
                addView.isEnabled = false
                didSetAddDisabled = true
            case .all:
                subtractView.isEnabled = false
                addView.isEnabled = false
                didSetAddDisabled = true
                didSetSubtractDisabled = true
            }
        }
    }
    
    private var isKeyboardEnabled: Bool = true {
        didSet {
            numCounterTextField.isUserInteractionEnabled = isKeyboardEnabled
        }
    }

    // Adicione esse método para habilitar ou desabilitar o teclado
    public func configureKeyboard(state: State) {
        switch state {
        case .enabled:
            isKeyboardEnabled = true
        case .disabled:
            isKeyboardEnabled = false
        }
    }

    /// Returns the value of counter
    public func getValue() -> Int {
        return numCounter
    }

    // MARK: - Private methods

    private func setupButtons() {
        subtractView.configure(height: size.buttonHeight, width: size.buttonWidth)
        addView.configure(height: size.buttonHeight, width: size.buttonWidth)

        subtractView.roundCorners(corners: [.layerMinXMinYCorner, .layerMinXMaxYCorner],
                                  radius: size.borderRadius,
                                  sizeWidth: size.buttonWidth,
                                  sizeHeight: size.buttonHeight)
        
        addView.roundCorners(corners: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner],
                                  radius: size.borderRadius,
                                  sizeWidth: size.buttonWidth,
                                  sizeHeight: size.buttonHeight)
        
        subtractView.action = {
            self.numCounter -= 1
            self.counterChangeValueHandler?(self.numCounter)
        }

        addView.action = {
            self.numCounter += 1
            self.counterChangeValueHandler?(self.numCounter)
        }
    }


    private func checkLimit() {
        if !didSetSubtractDisabled {
            if numCounter == minCount {
                subtractView.isEnabled = false
            } else if numCounter > minCount {
                subtractView.isEnabled = true
            }
        }

        if !didSetAddDisabled {
            if numCounter == maxCount {
                addView.isEnabled = false
            } else if numCounter < maxCount {
                addView.isEnabled = true
            }
        }
    }

    private func setupConstraints() {
        addSubview(label)
        addSubview(stackViewContainer)

        numCounterLabelView.addSubview(numCounterTextField)
        stackViewContainer.addArrangedSubview(subtractView)
        stackViewContainer.addArrangedSubview(numCounterLabelView)
        stackViewContainer.addArrangedSubview(addView)
        
        stackViewContainer.distribution = .fill
        let middleViewWidth = numCounterLabelView.widthAnchor.constraint(equalTo: subtractView.widthAnchor, multiplier: 1.2)
        middleViewWidth.isActive = true

        NSLayoutConstraint.activate([
            stackViewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            stackViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor),

            numCounterTextField.centerYAnchor.constraint(equalTo: numCounterLabelView.centerYAnchor),
            numCounterTextField.centerXAnchor.constraint(equalTo: numCounterLabelView.centerXAnchor),

            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

// MARK: - Extensions

extension UIView {
    func addBorder(with color: UIColor?, andWidth borderWidth: CGFloat, atTop: Bool) {
        let border = UIView()
        border.backgroundColor = color

        if atTop {
            border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
            border.frame = CGRect(x: 0, y: 0,
                                  width: frame.size.width, height: borderWidth)
        } else {
            border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
            border.frame = CGRect(x: 0, y: frame.size.height - borderWidth,
                                  width: frame.size.width, height: borderWidth)
        }

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
    
    func roundCornersAdd(radius: CGFloat,
                      sizeWidth: CGFloat,
                      sizeHeight: CGFloat) {
        if #available(iOS 11, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        } else {
            var cornerMask = UIRectCorner()
            cornerMask.insert(.topRight)
            cornerMask.insert(.bottomRight)
            
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

