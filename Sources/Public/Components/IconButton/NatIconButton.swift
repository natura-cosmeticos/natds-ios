import Foundation

/**
    NatIconButton is a class that represents  icon buttons  component from the design system.
    The button colors changes according with the current theme configured in the Design system.

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
     State represents states values for the NatIconButton component.

        These are all states allowed for a NatIconButton:
        - enabled
        - disabled
    */
    public enum State {
        case enabled
        case disabled
    }

    private let iconView: IconView = {
        let iconView = IconView(fontSize: NatSizes.standard)
        //iconView.icon = .outlinedDefaultMockup
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
    public func configure(action: @escaping () -> Void) {
        self.action = action
    }

    public func configure(badgeValue: UInt) {
        if badgeValue <= 0 {
            removeBadge()
        } else {
            configure(badgeStyle: .standard, withColor: .alert)
            setBadge(count: Int(badgeValue))
        }
    }

    public func configure(icon: Icon) {
        iconView.icon = icon
    }

    public func configure(state: State) {
        currentState = state

        style.applyStyle(self)
    }

    public func configure(icon: String) {
        iconView.iconLabel.text = icon
    }
}

// MARK: - Internal methods

extension NatIconButton {
    func configure(iconColor: UIColor) {
        iconView.tintColor = iconColor
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
