//
//  NatFilter.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 04/05/23.
//  Copyright © 2023 Natura. All rights reserved.
//

/**
 NatFilter is a class that represents the Filter component from the design system.

 Example of usage:

     let filter = NatFilter(size: .semi, color: .neutral)
     filter.configure(text: "NatFilter example text")
     filter.configure(icon: getIcon(.outlinedDefaultMockup), position: .left)
     filter.configure(avatar: natAvatar, position: .right)
     filter.configure(state: .normal)
     filter.configure(actionHandler: { isSelect in
        //do something
     })

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

        DesignSystem().configure(with: AvailableTheme)
 */

public final class NatFilter: UIView {

    // MARK: - Private properties

    private let size: NatFilter.Size
    private let color: NatFilter.Color
    private var nextState: UIControl.State = .normal

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = size.value/2
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.micro
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body2)
        label.textColor = NatColors.highEmphasis
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let circleView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: NatSizes.standard).isActive = true
        view.widthAnchor.constraint(equalToConstant: NatSizes.standard).isActive = true
        view.layer.cornerRadius = NatSizes.standard/2
        view.backgroundColor = NatColors.highEmphasis.withAlphaComponent(NatOpacities.low)
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var actionHandler: ((Bool) -> Void)?

    // MARK: - Public properties

    public private(set) var state: UIControl.State = .normal {
        didSet {
            setupUI()
            isSelected = state == .selected
        }
    }

    public private(set) var isSelected = false {
        didSet {
            actionHandler?(isSelected)
        }
    }

    // MARK: - Init

    public init(size: NatFilter.Size = .semi,
                color: NatFilter.Color = .neutral) {
        self.size = size
        self.color = color
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(backgroundView)
        stackView.addArrangedSubview(label)
        backgroundView.addSubview(stackView)
        backgroundView.addSubview(circleView)
        addConstraints()
        setupUI()
    }

    private func addConstraints() {
        backgroundView.heightAnchor.constraint(equalToConstant: size.value).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        stackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                           constant: size == .medium ? NatSpacing.small :
                                            NatSpacing.tiny).isActive = true
        stackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                            constant: size == .medium ? -NatSpacing.small :
                                                -NatSpacing.tiny).isActive = true
        stackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true

        circleView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        circleView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if state != .disabled {
                state = state != .selected ? .selected : .normal
        }
    }

    private func setupUI() {
        switch state {
        case .normal:
            backgroundView.layer.borderColor = color.borderColor.cgColor
            backgroundView.backgroundColor = .clear
            label.textColor = NatColors.highEmphasis
        case .disabled:
            backgroundView.layer.borderColor = NatColors.lowEmphasis.cgColor
            backgroundView.backgroundColor = .clear
            label.textColor = NatColors.lowEmphasis
            stackView.arrangedSubviews.forEach {
                if $0 != label {
                    $0.tintColor = NatColors.lowEmphasis
                }
            }
        case .focused:
            backgroundView.backgroundColor = backgroundView.backgroundColor?.withAlphaComponent(NatOpacities.low)
        case .selected:
            backgroundView.layer.borderColor = color.selectedColor.cgColor
            backgroundView.backgroundColor = color.selectedColor
            label.textColor = color.labelColor
            stackView.arrangedSubviews.forEach {
                if $0 != label {
                    $0.tintColor = color.labelColor
                }
            }
        default:
            state = .normal
        }

        backgroundColor = .clear
    }

    private func createIconView(icon: String?) -> IconView {
        let iconView = IconView(fontSize: NatSizes.standard)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.iconText = icon
        iconView.tintColor = label.textColor
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }

    private func removeFromStack(on position: NatFilter.Position) {
        let indexToRemove = position == .left ? 0 : 2
        let subviews = stackView.arrangedSubviews
        if indexToRemove < subviews.count, subviews[indexToRemove] != label {
            subviews[indexToRemove].removeFromSuperview()
        }
    }

    private func addToStack(view: UIView, on position: NatFilter.Position) {
        removeFromStack(on: position)
        if position == .left {
            stackView.insertArrangedSubview(view, at: .zero)
        } else {
            stackView.addArrangedSubview(view)
        }
        setupUI()
    }

    @objc private func tapHandler(gesture: UITapGestureRecognizer) {
        if state != .disabled {
            if gesture.state == .began {
                circleView.isHidden = false
            } else if gesture.state == .ended {
                circleView.isHidden = true
                state = state != .selected ? .selected : .normal
            }
        }
    }

    // MARK: - Public Methods

    /// Sets the text of the component.
    ///
    /// Example of usage:
    /// ```
    /// natFilter.configure(text: "NatFilter example text")
    /// ```
    /// - Parameter text: A `String` that set the text of the component
    public func configure(text: String) {
        self.label.text = text
    }

    /// Sets an icon to the component.
    ///
    /// Example of usage:
    /// ```
    /// natFilter.configure(icon: getIcon(.outlinedDefaultMockup), position: .left)
    /// ```
    /// - Parameters:
    ///   - icon:  A `String` that set an icon to the component
    ///   - position: A `NatFilter.Position` that indicates the position of the icon
    public func configure(icon: String?, position: NatFilter.Position) {
        let view = createIconView(icon: icon)
        addToStack(view: view, on: position)
    }

    /// Sets an avatar to the component.
    ///
    /// Example of usage:
    /// ```
    /// natFilter.configure(avatar: natAvatar, position: .left)
    /// ```
    /// - Parameters:
    ///   - avatar:  A `NatAvatar` that set an avatar to the component
    ///   - position: A `NatFilter.Position` that indicates the position of the avatar
    public func configure(avatar: NatAvatar, position: NatFilter.Position) {
        addToStack(view: avatar, on: position)
    }

    /// Sets the state of the component.
    ///
    /// Example of usage:
    /// ```
    /// natFilter.configure(state: .normal)
    /// ```
    /// - Parameter state: An `UIControl.State` that changes the state of the component
    public func configure(state: UIControl.State) {
        self.state = state
    }

    /// Sets the handler to be executed when `isSelected` value changes
    ///
    /// Example of usage:
    /// ```
    /// natFilter.configure { isSelected in }
    /// ```
    /// - Parameter actionHandler: A closure to notify value change
    public func configure(actionHandler: @escaping (Bool) -> Void) {
        self.actionHandler = actionHandler
    }
}

