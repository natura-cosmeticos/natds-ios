import UIKit

/**
 NatButton is a class that represents  button  component from the design system.
 The button colors changes according with the current theme configured in the Design system.

This button has 3 styles:
- Contained
- Outlined
- Text

        Example of usage:
            - let containedButton = NatButton(style: .contained)
            - let outlinedButton = NatButton(style: .outlined)
            - let textButton = NatButton(style: .text)

        This button has predefined height values with enum NatButton.Height:
            - button.heightAnchor.constraint(equalToConstant: NatButton.Height.medium)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.
 DesignSystem().configure(with: AvailableTheme)
 */

public final class NatButton: UIButton, Pulsable {

    // MARK: - Private properties

    private let style: Style
    private let notificationCenter: NotificationCenterObservable
    private var iconView: IconView?

    // MARK: - Public properties

    public override var isEnabled: Bool {
        didSet {
            style.changeState?(self)
            iconView?.tintColor = titleLabel?.textColor
        }
    }

    // MARK: - Inits

    public convenience init(style: Style) {
        self.init(style: style, notificationCenter: NotificationCenter.default)
    }

    init(style: Style, notificationCenter: NotificationCenterObservable) {
        self.style = style
        self.notificationCenter = notificationCenter

        super.init(frame: .zero)

        style.applyStyle(self)

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
     configured in NatButton as default behavior: Normal & Disabled.

     When this method is used, it configures title using an attributed string.

     If a different state or behavior is needed for configure a title, use native approuch like
     - setTitle(title: String?, for: UIControl.State)
     - setAttributedTitle(NSAttributedString?, for: UIControl.State)

     - Parameters:
     - title: This String will be used to configure Normal & Disabled states.
     */
    public func configure(title: String) {
        style.applyTitle(title, self)
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
            addPulseLayerAnimated(at: point, in: layer, removeAfterAnimation: false)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        removePulseLayer(layer: layer)
    }
}

// MARK: - NotificationCenter

extension NatButton {
    @objc private func themeHasChanged() {
        style.changeState?(self)
        iconView?.tintColor = titleLabel?.textColor
    }
}

// MARK: - Configure IconView

extension NatButton {
    private func createIconView(icon: String?) -> IconView {
        let iconView = IconView(fontSize: NatSizes.standard)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.iconText = icon
        iconView.tintColor = titleLabel?.textColor

        return iconView
    }

    private func setupConstraints(for iconView: IconView, at position: Position) {
        guard
            let title = titleLabel
        else { return }

        iconView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        switch position {
        case .left:
            iconView.trailingAnchor
                .constraint(equalTo: title.leadingAnchor, constant: -NatSizes.micro).isActive = true

        case .right:
            iconView.leadingAnchor
                .constraint(equalTo: title.trailingAnchor, constant: NatSizes.micro).isActive = true
        }
    }

    private func createTitleEdgeInsets(_ position: NatButton.Position) -> UIEdgeInsets {
        let spaceBetweenIconAndTitle = NatSizes.micro
        let iconSize = NatSizes.standard
        let padding = iconSize + spaceBetweenIconAndTitle

        switch position {
        case .left: return .init(top: 0, left: padding, bottom: 0, right: 0)
        case .right: return .init(top: 0, left: 0, bottom: 0, right: padding)
        }
    }
}
