import UIKit

/**
 - NOTE:
 NatSnackbar is a class that represents a component from the design system.
 Its colors change according to the current brand theme.
 
 To create and configure the dialog it's necessary to use Snackbar Builders, which are available as class properties.

 Configurable elements for the dialog:
 - Title
 - Icon
 - Body
 - Action button (Text or icon button)
 - Feedback
 - Position
 - Timer
 - Animation

Example of usage:

             let snackbar = NatSnackbar()
             snackbar.configure(title: "Title")
             snackbar.configure(body: "Body")
             snackbar.present(from: self)

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public final class NatSnackbar: UIView {
    private let inlineButtonMaxLength = 9

    internal var iconText: String?
    internal var position: NatSnackbar.Position = .bottomCenter
    internal var animation: NatSnackbar.Animation = .none
    internal var timer: NatSnackbar.Timer = .minimum

    internal var action: (() -> Void)?

    // MARK: - Subviews

    private let containerView: NatCard = {
        let card = NatCard()
        card.configure(elevation: true)
        card.configure(borderRadius: true)
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()

    private let hStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .top
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let vStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let iconView: IconView = {
        let icon = IconView()
        icon.isHidden = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .subtitle1)
        label.isHidden = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body2)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let blockButtonView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let blockButton: NatButton = {
        let button = NatButton(style: .contained)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let inlineButtonView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let inlineButton: NatButton = {
        let button = NatButton(style: .contained)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let inlineIconButtonView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let inlineIconButton: NatIconButton = {
        let button = NatIconButton(style: .standardLight)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Inits

    required public init() {
        super.init(frame: .zero)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Action Methods

    @objc func callAction() {
        self.action?()
    }
}

// MARK: - Public methods

extension NatSnackbar {
    /// Sets the body text of the component.
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.configure(body: "Texto exemplo")
    /// ```
    /// - Parameter title: An `String` that sets the title of the component

    public func configure(body: String) {
        self.bodyLabel.text = body
    }

    /// Sets the title of the component.
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.configure(title: "Texto exemplo")
    /// ```
    /// - Parameter title: An `String` that sets the title of the component

    public func configure(title: String) {
        self.titleLabel.text = title
        self.titleLabel.isHidden = title.isEmpty
    }

    /// Sets an icon of the component.
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.configure(icon: getIcon(icon: .outlinedAlertNotification))
    /// ```
    /// - Parameter icon: A `String` that sets an image for the icon
    public func configure(icon: String?) {
        self.iconText = icon
        self.iconView.isHidden = icon == nil
    }

    /// Sets an action button to the component.
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.configure(actionButton: .text(title: "Dismiss"))
    /// ```
    /// - Parameters:
    ///   - actionButton: A `NatSnackbar.ActionButton` that indicates the type of the action button
    public func configure(actionButton: NatSnackbar.ActionButton) {
        self.setupActionButton(actionButton)
    }

    /// Sets the functionality for the action button inside the NatSnackbar component. Example:
    ///
    ///     natSnackbar.configure(delegate: self) { (self) in
    ///         // your code for icon button's tap
    ///     }
    ///
    /// - Parameters:
    ///   - delegate: the class that is the delegate for the action (usually, the class itself)
    ///   - action: a block of code to be run when the icon button is pressed
    public func configure<Object: AnyObject>(delegate: Object, action: @escaping (Object) -> Void) {
        self.action = { [weak delegate] in
            if let delegate = delegate {
                action(delegate)
            }
        }
    }

    /// Sets the feedback style to the NatSnackbar component.
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.configure(feedback: .text("Dismiss"))
    /// ```
    /// - Parameters:
    ///   - feedbackStyle: A `NatSnackbar.Feedback` that indicates the feedback style of component
    public func configure(feedback: NatSnackbar.Feedback) {
        self.setupFeedback(feedback)
    }

    /// Sets the position where the NatSnackbar component will appear.
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.configure(position: .bottom)
    /// ```
    /// - Parameters:
    ///   - position: A `NatSnackbar.Position` that indicates the position of the component
    public func configure(position: NatSnackbar.Position) {
        self.position = position
    }

    /// Present the NatSnackbar on a view controller
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.present(from: self)
    /// ```
    /// - Parameters:
    ///   - from: A `UIViewController` where the component will be presented from
    public func present(from: UIViewController) {
        guard let view = from.view else { return }

        DispatchQueue.main.async {
            self.presentSnackbarFrom(view: view)
        }
    }
}

// MARK: - Private methods

extension NatSnackbar {
    private func setup() {
        self.alpha = 0.0
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupFeedback(.default)
        self.setupAction()

        self.addSubview(self.containerView)

        self.containerView.addSubview(self.hStackView)

        self.blockButtonView.addSubview(self.blockButton)
        self.inlineButtonView.addSubview(self.inlineButton)
        self.inlineIconButtonView.addSubview(self.inlineIconButton)

        self.hStackView.addArrangedSubview(self.iconView)
        self.hStackView.addArrangedSubview(self.vStackView)
        self.hStackView.addArrangedSubview(self.inlineButtonView)
        self.hStackView.addArrangedSubview(self.inlineIconButtonView)

        self.vStackView.addArrangedSubview(self.titleLabel)
        self.vStackView.addArrangedSubview(self.bodyLabel)
        self.vStackView.addArrangedSubview(self.blockButtonView)

        self.addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: NatSpacing.small),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: NatSpacing.standard),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -NatSpacing.standard),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -NatSpacing.small),
            hStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: NatSpacing.small),
            hStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: NatSpacing.small),
            hStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -NatSpacing.small),
            hStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -NatSpacing.small),
            iconView.widthAnchor.constraint(equalToConstant: NatSizes.standard),
            iconView.heightAnchor.constraint(equalToConstant: NatSizes.standard),
            inlineButtonView.topAnchor.constraint(equalTo: hStackView.topAnchor),
            inlineButtonView.bottomAnchor.constraint(equalTo: hStackView.bottomAnchor),
            inlineButton.heightAnchor.constraint(equalToConstant: NatSizes.semiX),
            inlineButton.leadingAnchor.constraint(equalTo: inlineButtonView.leadingAnchor, constant: NatSpacing.tiny),
            inlineButton.trailingAnchor.constraint(equalTo: inlineButtonView.trailingAnchor),
            inlineButton.centerYAnchor.constraint(equalTo: inlineButtonView.centerYAnchor),
            inlineIconButtonView.topAnchor.constraint(equalTo: hStackView.topAnchor),
            inlineIconButtonView.bottomAnchor.constraint(equalTo: hStackView.bottomAnchor),
            inlineIconButton.leadingAnchor.constraint(equalTo: inlineIconButtonView.leadingAnchor, constant: NatSpacing.tiny),
            inlineIconButton.trailingAnchor.constraint(equalTo: inlineIconButtonView.trailingAnchor),
            inlineIconButton.centerYAnchor.constraint(equalTo: inlineIconButtonView.centerYAnchor),
            blockButtonView.leadingAnchor.constraint(equalTo: vStackView.leadingAnchor),
            blockButtonView.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor),
            blockButton.heightAnchor.constraint(equalToConstant: NatSizes.semiX),
            blockButton.topAnchor.constraint(equalTo: blockButtonView.topAnchor),
            blockButton.bottomAnchor.constraint(equalTo: blockButtonView.bottomAnchor),
            blockButton.trailingAnchor.constraint(equalTo: blockButtonView.trailingAnchor),
            blockButton.leadingAnchor.constraint(greaterThanOrEqualTo: blockButtonView.leadingAnchor)
        ])
    }

    private func presentSnackbarFrom(view: UIView) {
        view.addSubview(self)

        var presentContraits: [NSLayoutConstraint] = [
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]

        switch position {
        case .topCenter:
            if #available(iOS 11.0, *) {
                presentContraits.append(self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
            } else {
                presentContraits.append(self.topAnchor.constraint(equalTo: view.topAnchor))
            }
        case .bottomCenter:
            if #available(iOS 11.0, *) {
                presentContraits.append(self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
            } else {
                presentContraits.append(self.bottomAnchor.constraint(equalTo: view.bottomAnchor))
            }
        }

        NSLayoutConstraint.activate(presentContraits)

        self.layoutSubviews()
        self.alpha = 1.0
    }

    private func setupFeedback(_ feedback: Feedback) {
        self.containerView.backgroundColor = feedback.color
        self.iconView.tintColor = feedback.textColor
        self.bodyLabel.textColor = feedback.textColor
        self.titleLabel.textColor = feedback.textColor
        self.inlineIconButton.configure(iconColor: feedback.textColor)
    }

    private func setupAction() {
        self.blockButton.addTarget(self, action: #selector(callAction), for: .touchUpInside)
        self.inlineButton.addTarget(self, action: #selector(callAction), for: .touchUpInside)
        self.inlineIconButton.configure(delegate: self, action: {_ in
            self.callAction()
        })
    }
    
    private func setupActionButton(_ actionButton: ActionButton) {
        self.blockButton.configure(title: "")
        self.inlineButton.configure(title: "")
        self.inlineIconButton.configure(icon: "")

        self.blockButtonView.isHidden = true
        self.inlineButtonView.isHidden = true
        self.inlineIconButtonView.isHidden = true
        
        switch actionButton {
        case .none:
            break
        case .button(let title):
            if title.count > inlineButtonMaxLength {
                self.blockButton.configure(title: title)
                self.blockButtonView.isHidden = false
            } else {
                self.inlineButton.configure(title: title)
                self.inlineButtonView.isHidden = false
            }
        case .iconButton(let icon):
            if !icon.isEmpty {
                self.inlineIconButton.configure(icon: icon)
                self.inlineIconButtonView.isHidden = false
            }
        }
    }
}
