import Foundation

/**
    NatIconButton is a class that represents  icon buttons  component from the design system.
    The button colors changes according to the current theme configured in the Design System.

    This button has 2 styles:
    - standardDefault
    - standardPrimary

    Example of usage:
 
            let iconButtonDefault = NatIconButton(style: .standardDefault)
            let iconButtonPrimary = NatIconButton(style: .standardPrimary)

 - Requires:
    It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme) 
 */

public final class NatIconButton: UIView {
    /**
     State represents state values for NatIconButton component.
     
     These are all states allowed for a NatIconButton:
     - enabled
     - disabled
     */
    public enum State {
        case enabled
        case disabled
    }

    internal let iconView: IconView = {
        let iconView = IconView(fontSize: NatSizes.standard)
        iconView.translatesAutoresizingMaskIntoConstraints = false

        return iconView
    }()

    // MARK: - Private properties

    private let style: Style
    private let notificationCenter: NotificationCenterObservable

    private var action: (() -> Void)?
    private (set) var currentState: State = .enabled

    // MARK: - Inits

    public convenience init(style: Style) {
        self.init(style: style, notificationCenter: NotificationCenter.default)
    }

    init(style: Style, notificationCenter: NotificationCenterObservable) {
        self.style = style
        self.notificationCenter = notificationCenter

        super.init(frame: .zero)

        style.applyStyle(self)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Deinit

    deinit {
        notificationCenter.removeObserver(self)
    }

    // MARK: - User interactions

    @objc func tapHandler(_ sender: UIGestureRecognizer) {
        guard currentState == .enabled else { return }
        action?()
        removePulseLayer(layer: layer)
    }

    // MARK: - Overrides

    public override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = NatBorderRadius.circle(viewHeight: bounds.height)
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        guard currentState == .enabled else { return }

        let opacity = getTokenFromTheme(\.opacityDisabledLow)
        let color = iconView.tintColor.withAlphaComponent(opacity)

        addPulseLayerAnimated(
            at: centerBounds,
            in: layer,
            withColor: color,
            removeAfterAnimation: false
        )
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        removePulseLayer(layer: layer)
    }
}

// MARK: - Public methods

extension NatIconButton {
    /// Sets the functionality for the icon button.
    /// - Parameter action: A block of functionality to be executed when the icon button is pressed
    public func configure(action: @escaping () -> Void) {
        self.action = action
    }
    
    /// Sets a badge for the icon button
    /// - Parameter badgeValue: A UInt indicating a value for the badge
    public func configure(badgeValue: UInt) {
        if badgeValue <= 0 {
            removeBadge()
        } else {
            configure(badgeStyle: .standard, withColor: .alert)
            setBadge(count: Int(badgeValue))
        }
    }
    
    /// Sets the state of the icon button.
    /// - Parameter state: An option from State enum: enabled or disabled
    public func configure(state: State) {
        currentState = state

        style.applyStyle(self)
    }

    /// Sets an icon for the button view.
    /// - Parameter icon: An icon from NatDSIcons, using the function `getIcon` from NatDSIcons
    public func configure(icon: String?) {
        iconView.iconText = icon
    }

    internal func configure(iconImage: UIImage?) {
        iconView.defaultImageView.image = iconImage
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - Internal methods

extension NatIconButton {
    func configure(iconColor: UIColor) {
        iconView.tintColor = iconColor
        iconView.defaultImageView.tintedColor = iconColor
    }
}

// MARK: - Private methods - UI

extension NatIconButton {
    private func setup() {
        addSubview(iconView)

        addConstraints()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        addGestureRecognizer(tapGesture)

        notificationCenter.addObserver(
            self,
            selector: #selector(themeHasChanged),
            name: .themeHasChanged,
            object: nil
        )
    }

    private func addConstraints() {
        let constraints = [
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - Pulsable

extension NatIconButton: Pulsable {}

// MARK: - Badgeable

extension NatIconButton: Badgeable {}

// MARK: - NotificationCenter

extension NatIconButton {
    @objc private func themeHasChanged() {
        style.applyStyle(self)
    }
}
