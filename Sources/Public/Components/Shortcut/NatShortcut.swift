/**
 NatShortcut is a class that represents a component from the design system.
 The shortcut colors change according to the current theme configured in the Design System.

 This component has 4 styles:
    - Contained with Primary color
    - Contained with Default color
    - Outlined with Primary color
    - Outlined with Default color

 Example of usage:

        let containedPrimary = NatShortcut(style: .containedPrimary)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

        DesignSystem().configure(with: AvailableTheme)
 */

public final class NatShortcut: UIView {

    public enum State {
        case enabled
        case disabled
    }

    public var style: Style {
        didSet {
            style.applyStyle(self)
        }
    }

    public var color: Color {
        didSet {
            style.applyStyle(self)
        }
    }

    public var state: State = .enabled {
        didSet {
            style.applyStyle(self)
        }
    }

    // MARK: - Private properties

    private lazy var shortcutView: ShortcutView = {
        let view = ShortcutView(icon: icon)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: getComponentAttributeFromTheme(\.shortcutLabelFontSize),
                                   withWeight: getComponentAttributeFromTheme(\.shortcutLabelPrimaryFontWeight),
                                   withFamily: getComponentAttributeFromTheme(\.shortcutLabelPrimaryFontFamily))
        label.textColor = getUIColorFromTokens(\.colorHighEmphasis)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private var icon: String? {
        didSet {
            shortcutView.configure(icon: icon)
        }
    }

    private var text: String? {
        didSet {
            // swiftlint:disable line_length
            label.attributedText = text?.attributedStringWith(lineHeight: getComponentAttributeFromTheme(\.shortcutLabelLineHeight),
                                                              letterSpacing: getComponentAttributeFromTheme(\.shortcutLabelLetterSpacing))
            label.textAlignment = .center
            label.lineBreakMode = lineBreakMode
            label.numberOfLines = numberOfLines
        }
    }

    private var lineBreakMode: NSLineBreakMode = .byTruncatingTail {
        didSet {
            label.lineBreakMode = lineBreakMode
        }
    }

    private var numberOfLines: Int = 0 {
        didSet {
            label.numberOfLines = numberOfLines
        }
    }

    private let notificationCenter: NotificationCenterObservable
    private var action: (() -> Void)?

    // MARK: - Inits

    public convenience init(style: Style = .contained, color: Color = .primary) {
        self.init(style: style, color: color, text: nil, icon: nil, notificationCenter: NotificationCenter.default)
    }

    public convenience init(style: Style = .contained, color: Color = .primary, text: String? = nil, icon: String? = nil) {
        self.init(style: style, color: color, text: text, icon: icon, notificationCenter: NotificationCenter.default)
    }

    init(style: Style, color: Color, text: String?, icon: String?, notificationCenter: NotificationCenterObservable) {
        self.style = style
        self.color = color
        self.text = text
        self.icon = icon
        self.notificationCenter = notificationCenter

        super.init(frame: .zero)

        style.applyStyle(self)
        setup()
    }

    // MARK: - Deinit

    deinit {
        notificationCenter.removeObserver(self)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - User interactions

    @objc func tapHandler(_ sender: UITapGestureRecognizer) {
        guard self.state == .enabled else { return }

        action?()

        addPulseLayerAnimated(at: shortcutView.centerBounds,
                              in: shortcutView.layer, removeAfterAnimation: true)
    }

    @objc func longPressHandler(_ sender: UILongPressGestureRecognizer) {
        guard self.state == .enabled else { return }

        switch sender.state {
        case .began:
            addPulseLayerAnimated(at: shortcutView.centerBounds,
                                  in: shortcutView.layer, removeAfterAnimation: true)
        case .ended:
            removePulseLayer(layer: shortcutView.layer)
        default:
            break
        }
    }
}

// MARK: - Public methods

extension NatShortcut {

    // TODO: documentar
    public func configure(state: State) {
        self.state = state
    }

    /// Sets an icon for the shortcut view
    ///
    /// - Parameter icon: An icon from NatDSIcons.
    /// Example of usage:
    ///
    ///     shortcut.configure(icon: getIcon(icon: .outlinedAlertNotification))
    public func configure(icon: String?) {
        self.icon = icon
    }

    /// Configures text for shortcut bottom label.
    ///
    /// - Parameter text: A string with the text to display on the label.
    public func configure(text: String) {
        self.text = text
    }

    /// Sets the functionality for the shortcut.
    ///
    /// - Parameter action: A block of functionality to be executed when the shorcut is pressed
    public func configure(action: @escaping () -> Void) {
        self.action = action
    }

    /// Configures label text width and lines for long texts
    ///
    /// - Parameters:
    ///   - numberOfLines: the number of lines to be displayed
    ///   - lineBreakMode: the line break mode for long texts
    public func configureText(numberOfLines: Int, lineBreakMode: NSLineBreakMode) {
        self.lineBreakMode = lineBreakMode
        self.numberOfLines = numberOfLines
    }

    /// Configures a badge to the shortcut.
    ///
    /// - Parameter badge: A badge from the design system.
    /// The badge must be created and configured before setting it to the shortcut.
    ///
    /// Example of usage:
    /// ```
    /// let badge = NatBadge(style: .standard, color: .primary)
    /// badge.configure(limit: .max99)
    /// badge.configure(count: 100)
    /// shortcut.configure(badge: badge)
    /// ```
    public func configure(badge: NatBadge) {
        badge.addToView(shortcutView)
    }

    @available(*, deprecated, message: "Use configure(badge:) instead")
    public func configure(badgeValue: UInt) {
        shortcutView.configure(badgeValue: badgeValue)
    }
}

// MARK: - Internal methods

extension NatShortcut {
    func configure(circleColor color: UIColor) {
        shortcutView.backgroundColor = color
    }

    func configure(circleBorderWidth value: CGFloat) {
        shortcutView.layer.borderWidth = value
    }

    func configure(circleBorderColor color: CGColor) {
        shortcutView.layer.borderColor = color
    }

    func configure(iconColor color: UIColor) {
        shortcutView.configure(iconColor: color)
    }

    func configure(labelColor color: UIColor) {
        self.label.textColor = color
    }

    func configure(elevation: NatElevation.ElevationAttributes) {
        ViewStyle.applyElevation(on: shortcutView, with: elevation)
    }
}

// MARK: - Private methods - UI

extension NatShortcut {
    private func setup() {
        addSubview(shortcutView)
        addSubview(label)

        addConstraints()
        addGestures()

        notificationCenter.addObserver(
            self,
            selector: #selector(themeHasChanged),
            name: .themeHasChanged,
            object: nil
        )
    }

    private func addConstraints() {
        let circleSize = NatSizes.mediumX

        let constraints = [
            shortcutView.topAnchor.constraint(equalTo: topAnchor),
            shortcutView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            shortcutView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            shortcutView.centerXAnchor.constraint(equalTo: centerXAnchor),
            shortcutView.widthAnchor.constraint(equalToConstant: circleSize),
            shortcutView.heightAnchor.constraint(equalToConstant: circleSize),

            label.topAnchor.constraint(equalTo: shortcutView.bottomAnchor, constant: getTokenFromTheme(\.sizeTiny)),
            label.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            label.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            label.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func addGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.delaysTouchesBegan = true
        tapGesture.delaysTouchesEnded = true

        addGestureRecognizer(tapGesture)

        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler))
        longPressGesture.minimumPressDuration = 0.5
        longPressGesture.delaysTouchesBegan = true
        longPressGesture.delaysTouchesEnded = true

        addGestureRecognizer(longPressGesture)
    }
}

// MARK: - NotificationCenter

extension NatShortcut {
    @objc private func themeHasChanged() {
        style.applyStyle(self)
    }
}

// MARK: - Pulsable

extension NatShortcut: Pulsable {}
