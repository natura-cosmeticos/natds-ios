//
//  GaYaButton.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 28/04/24.
//  Copyright © 2024 Natura. All rights reserved.
//

public final class GaYaButton: UIButton, Pulsable {

    // MARK: - Private properties

    private let style: Style
    private let notificationCenter: NotificationCenterObservable
    private var iconView: IconView?
    private var theme: AvailableTheme
    private var size: GayaButtonHeight
    private var color: GaYaButtonColor

    // MARK: - Public properties

    public override var isEnabled: Bool {
        didSet {
            self.isHighlighted = false
            style.changeState(self.theme, self.color, self)
            iconView?.tintColor = titleLabel?.textColor
        }
    }

    // MARK: - Inits

    public convenience init(style: Style, size: GayaButtonHeight = .semix, theme: AvailableTheme = .none, color: GaYaButtonColor = .primary) {
        self.init(style: style, notificationCenter: NotificationCenter.default, size: size, theme: theme, color: color)
    }

    init(style: Style, notificationCenter: NotificationCenterObservable, size: GayaButtonHeight = .semix, theme: AvailableTheme = .none, color: GaYaButtonColor = .primary) {
        self.style = style
        self.notificationCenter = notificationCenter
        self.theme = theme
        self.size = size
        self.color = color

        super.init(frame: .zero)

        style.applyStyle(self.theme, self.color, self)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint: NSLayoutConstraint
            
        switch size {
            case .medium:
                heightConstraint = heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeMedium))
            case .semix:
                heightConstraint = heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemiX))
            case .semi:
                heightConstraint = heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemi))
        }
            
        heightConstraint.isActive = true
        
        if getComponentAttributeFromTheme(\.isButtonRounded) {
            self.layer.cornerRadius = heightConstraint.constant / 2
        } else {
            self.layer.cornerRadius = getComponentAttributeFromTheme(\.buttonBorderRadius)
        }
        
        notificationCenter.addObserver(
            self,
            selector: #selector(themeHasChanged),
            name: .themeHasChanged,
            object: nil
        )
    }

    // MARK: - Deinit

    deinit {
        notificationCenter.removeObserver(self)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    /**
     This method has the objective to set title for 2 states that aways have to be
     configured in GaYaButton as default behavior: Normal & Disabled.

     When this method is used, it configures title using an attributed string.

     If a different state or behavior is needed for configure a title, use native approuch like
     - setTitle(title: String?, for: UIControl.State)
     - setAttributedTitle(NSAttributedString?, for: UIControl.State)

     - Parameters:
     - title: This String will be used to configure Normal & Disabled states.
     */
    public func configure(title: String) {
        style.applyTitle(title, self.theme, self.color, self)
    }

    /**
     This method sets an icon at this button. Icons can be set at 2 sides, right & left.
     Example of usage:

            button.configure(getIcon(icon: .outlinedAlertNotification), position: .left)

     - Parameters:
     - icon:   Choose an icon from NatDSIcons
     - position:   This will be used to configure the icon alignmemt - it can be right or left side.
     */

    public func configure(icon: String?, position: Position) {
        iconView?.removeFromSuperview()

        let view = createIconView(icon: icon)
        addSubview(view)
        setupConstraints(for: view, at: position)

        iconView = view

        titleEdgeInsets = createTitleEdgeInsets(position)
    }

    // MARK: - Overrides

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        if let touch = touches.first {
            let point = touch.location(in: self)
            addPulseLayerAnimated(at: point,
                                  in: layer,
                                  removeAfterAnimation: false)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        removePulseLayer(layer: layer)
    }
}

// MARK: - NotificationCenter

extension GaYaButton {
    @objc private func themeHasChanged() {
        style.changeState(self.theme, self.color, self)
        iconView?.tintColor = titleLabel?.textColor
    }
}

// MARK: - Configure IconView

extension GaYaButton {
    private func createIconView(icon: String?) -> IconView {
        let iconView = IconView(fontSize: GaYaSizes.standard)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.iconText = icon
        iconView.tintColor = titleLabel?.textColor

        return iconView
    }

    private func setupConstraints(for iconView: IconView, at position: Position) {
        guard let title = titleLabel else { return }

        iconView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        switch position {
        case .left:
            iconView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor,
                                              constant: GaYaSizes.micro).isActive = true
            iconView.trailingAnchor.constraint(equalTo: title.leadingAnchor,
                                               constant: -GaYaSizes.micro).isActive = true

        case .right:
            iconView.leadingAnchor.constraint(equalTo: title.trailingAnchor,
                                              constant: GaYaSizes.micro).isActive = true
            iconView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor,
                                               constant: -GaYaSizes.micro).isActive = true
        }
    }

    private func createTitleEdgeInsets(_ position: GaYaButton.Position) -> UIEdgeInsets {
        let spaceBetweenIconAndTitle = GaYaSizes.micro
        let iconSize = GaYaSizes.standard
        let padding = iconSize + spaceBetweenIconAndTitle

        switch position {
        case .left: return .init(top: 0, left: padding, bottom: 0, right: 0)
        case .right: return .init(top: 0, left: 0, bottom: 0, right: padding)
        }
    }
}
