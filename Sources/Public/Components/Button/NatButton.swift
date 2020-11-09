import UIKit

/**
 NatButton is a class that represents  button  component from the design system.
 The button colors changes according with the current theme configured in the Design system.

 This button has 3 styles:
 - Contained
 - Outlined
 - Text

 Example of usage:

 let containedButton = NatButton(style: .contained)
 let outlinedButton = NatButton(style: .outlined)
 let textButton = NatButton(style: .text)

 This button has pre-defined height values with enum NatButton.Height:

 button.heightAnchor.constraint(equalToConstant: NatButton.Height.medium)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

 DesignSystem().configure(with: AvailableTheme)
 */

public final class NatButton: UIButton, Pulsable {

    // MARK: - Private properties

    private let style: Style
    private let notificationCenter: NotificationCenterObservable
    private lazy var buttonIconView: IconView = {
        let iconView = IconView(fontSize: NatSizes.standard)
        iconView.translatesAutoresizingMaskIntoConstraints = false

        return iconView
    }()

    // MARK: - Public properties

    public override var isEnabled: Bool {
        didSet {
            style.changeState?(self)
            buttonIconView.tintColor = titleLabel?.textColor
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
     This method has the objective to set the icon for 2 sides that aways have to be
     configured in NatButton as default behavior: Right & Left.

     - Parameters:
     - icon:   Choose some icon from the libary
     - position:   This will be used to configure the icon side, It can be right or left side.
     */

    public func configure(icon: Icon, position: Position) {
        buttonIconView.icon = icon
        buttonIconView.tintColor = titleLabel?.textColor

        setupIconButton(position)
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
    }
}

// MARK: - SetIconSide

extension NatButton {
    private func setupIconButton(_ position: Position) {
        guard let title = titleLabel else { return }
        let space = NatSizes.micro
        let iconSize = NatSizes.standard

        buttonIconView.removeFromSuperview()
        addSubview(buttonIconView)

        buttonIconView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        switch position {
        case .left:
            buttonIconView.trailingAnchor.constraint(equalTo: title.leadingAnchor, constant: -space).isActive = true
                titleEdgeInsets = .init(top: 0, left: iconSize+space, bottom: 0, right: 0)

        case .right:
            buttonIconView.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: space).isActive = true
            titleEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: iconSize+space)
        }
    }
}
