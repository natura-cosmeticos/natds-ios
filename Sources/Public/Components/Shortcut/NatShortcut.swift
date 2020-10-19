/**
 NatShortcut is a class that represents  a component from the design system.
 The shortcut colors changes according with the current theme configured in the Design system.

 This component has 4 styles:
    - Contained with Primary color
    - Contained with Default color
    - Outlined with Primary color
    - Outlined with Default color

 Example of usage:

        let containedPrimary = NatShortcut(style: .containedPrimary)
        let containedDefault = NatShortcut(style: .containedDefault)
        let outlinedPrimary = NatShortcut(style: .outlinedPrimary)
        let outlinedDefault = NatShortcut(style: .outlinedDefault)

 This shortcut has an enum NatShortcut.Widths with allowed values for width values, if needed:

        shortcut.widthAnchor.constraint(equalToConstant: NatShortcut.Widths.maximum)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

        DesignSystem().configure(with: AvailableTheme)
 */

public final class NatShortcut: UIView {

    // MARK: - Private properties

    private let circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = getTokenFromTheme(\.sizeMediumX) / 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let iconView: IconView = {
        let iconView = IconView(fontSize: getTokenFromTheme(\.sizeSemi))
        iconView.icon = .outlinedDefaultMockup
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .caption, withWeight: .regular)
        label.textColor = getUIColorFromTokens(\.colorHighEmphasis)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let style: Style
    private let notificationCenter: NotificationCenterObservable
    private var action: (() -> Void)?

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
        action?()

        beginPulseAt(
            point: circleView.centerBounds,
            in: circleView.layer
        )
        endPulse(layer: circleView.layer)
    }

    @objc func longPressHandler(_ sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .began: beginPulseAt(point: circleView.centerBounds, in: circleView.layer)
        case .ended: endPulse(layer: circleView.layer)
        default: break
        }
    }
}

// MARK: - Public methods

extension NatShortcut {
    public func configure(text: String) {
        label.text = text
    }

    public func configure(icon: Icon) {
        iconView.icon = icon
    }

    public func configure(action: @escaping () -> Void) {
        self.action = action
    }
}

// MARK: - Internal methods

extension NatShortcut {
    func configure(circleColor color: UIColor) {
        circleView.backgroundColor = color
    }

    func configure(circleBorderWidth value: CGFloat) {
        circleView.layer.borderWidth = value
    }

    func configure(circleBorderColor color: CGColor) {
        circleView.layer.borderColor = color
    }

    func configure(iconColor color: UIColor) {
        iconView.tintColor = color
    }
}

// MARK: - Private methods - UI

extension NatShortcut {
    private func setup() {
        circleView.addSubview(iconView)
        addSubview(circleView)
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
            circleView.topAnchor.constraint(equalTo: topAnchor),
            circleView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            circleView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.widthAnchor.constraint(equalToConstant: circleSize),
            circleView.heightAnchor.constraint(equalToConstant: circleSize),

            iconView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),

            label.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: getTokenFromTheme(\.sizeTiny)),
            label.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            label.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            label.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            label.widthAnchor.constraint(lessThanOrEqualToConstant: NatSizes.large),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func addGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        tapGesture.delaysTouchesBegan = true
        tapGesture.delaysTouchesEnded = true

        addGestureRecognizer(tapGesture)

        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler))
        longPressGesture.minimumPressDuration = 0.7
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
