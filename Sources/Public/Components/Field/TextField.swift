// swiftlint:disable line_length
// swiftlint:disable file_length
/**
 TextField is a class that represents a component from the design system.
 
 It can be configured with 2 different sizes:
 - MediumX (default)
 - Medium
 
 Example of usage:
 
            let textField = TextField()
            textfield.configure(size: .medium)
 
 The textField styles, keyboards, capitalization and autocorrection properties changes according to the chosen type.

 This TextField has 4 types:
 - Text (default type)
 - Name
 - Number
 - Password

 Example of usage:
 
        textField.configure(type: .text)
        textField.configure(type: .password(keyboardType: .numberPad)
 
 The TextField has 3 states for feedback, that can be configured with a message:
 - Error
 - Success
 - None (clear error/success states)
 
 Example of usage:
 
        textField.configure(state: .error, with: "Error")
 
 It also can be configured as a required field, 'read-only' field or disabled textField. Each interaction state has its pre-defined style:
 
        textField.configure(isEnabled: false)
        textField.configure(readOnly: true)
        textField.configure(required: true)
 
 The TextField also has an action item on the right, which can be configured with an icon from NatDSIcons, a local image or a remote image:
 
        textField.configure(icon: getIcon(.outlinedDefaultMockup)) {
            // action
        }
        field.configure(image: UIImage(named: "imageName")) {
            // action
        }
        field.configure(remoteImageURL: URL(string: "urlForImage")) {
            // action
        }

 There are properties that changes the textfield styles as well.

 Properties:
 - `title`: Label text always displayed above textfield
 - `placeholder`: Hint text to display when the text is empty
 - `helper`: Hint text always displayed below textfield
 - `error`: Text that alerts about an error

 Use the methods of TextFieldDelegate protocol to manage the following feature:
 - natTextFieldDidBeginEditing
 - natTextFieldDidEndEditing
 - natTextFieldEditingChanged
 - natTextFieldShouldBeginEditing
 - natTextField

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.
        
        DesignSystem().configure(with: AvailableTheme)
 */

public class TextField: UIView {

    // MARK: - Public vars

    /// A string with the text to be always displayed above textfield
    public var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }

    /// A string with the text inside the textField
    public var text: String? {
        get { textField.text }
        set {
            textField.text = newValue
            interactionState = text != nil ? .filled : .enabled
        }
    }

    /// A string with the hint text to be displayed when the textField is empty
    public var placeholder: String? {
        get { textField.placeholder }
        set { textField.placeholder = newValue}
    }

    /// A string with a helper text to be displayed below textField
    public var helper: String? {
        didSet {
            helperLabel.text = helper
        }
    }

    /// A string with a text that alerts about an error. It triggers the state `.error` for the textField.
    public var error: String? {
        didSet {
            configure(state: .error, with: error)
        }
    }

    /// The type of the textfield, chosen from the `TextFieldType` enum
    public var type: TextFieldType = .text {
        didSet {
            handleTextFieldType()
        }
    }

    /// A boolean that indicates if filling the textField is mandatory
    public var required: Bool = false {
        didSet {
            handleRequired()
        }
    }

    /// A boolean that indicates if the textField is filled with info that can't be changed
    public var readOnly: Bool = false {
        didSet {
            self.interactionState = readOnly ? .readOnly : .enabled
        }
    }

    /// A boolean that indicates if the textField is enabled or disabled
    public var isEnabled: Bool = true {
        didSet {
            self.interactionState = isEnabled ? .enabled : .disabled
        }
    }

    /// The size of the textfield, chosen from the `TextField.Size` enum
    public var size: Size = .mediumX {
        didSet {
            updateTextFieldHeightConstraint()
            layoutIfNeeded()
        }
    }

    public weak var delegate: TextFieldDelegate?

    // MARK: - Private vars

    private var textFieldHeightConstraint: NSLayoutConstraint?

    private var isEditing: Bool = false {
        didSet {
            self.interactionState = isEditing ? .active : .enabled
        }
    }

    private(set) var interactionState: InteractionState = .enabled {
        didSet {
            handleInteractionState()
            handleInteractionStateStyle()
        }
    }

    private(set) var state: FeedbackState = .none {
        didSet {
            handleFeedbackStyle()
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .button, withWeight: .medium)
        label.numberOfLines = 2
        return label
    }()

    public private(set) lazy var textField: Field = {
        let field = Field()
        field.delegate = self
        return field
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.alignment = .top
        return stackView
    }()

    private lazy var helperLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = NatFonts.font(ofSize: .caption, withWeight: .regular)
        return label
    }()

    private lazy var feedbackIconImageView: UIImageView = {
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSmall)).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSmall)).isActive = true
        return iconView
    }()

    private lazy var iconVisibility: UIImage? = {
        let icon = AssetsPath.iconOutlinedActionVisibility.rawValue
        return icon
    }()

    private lazy var iconButtonVisibility: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault)
        iconButton.configure(iconImage: iconVisibility)
        iconButton.configure {
            self.setIconVisibility()
        }
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemi)).isActive = true
        iconButton.widthAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemi)).isActive = true

        return iconButton
    }()

    private lazy var iconButtonGeneral: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemi)).isActive = true
        iconButton.widthAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSemi)).isActive = true
        return iconButton
    }()

    private lazy var actionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension TextField {

    @discardableResult
    override func becomeFirstResponder() -> Bool {
        return textField.becomeFirstResponder()
    }

    @discardableResult
    override func resignFirstResponder() -> Bool {
        return textField.resignFirstResponder()
    }
}

extension TextField {

    private func setup() {
        addTitleLabel()
        addTextField()
        addStackView()
        stackView.addArrangedSubview(feedbackIconImageView)
        stackView.addArrangedSubview(helperLabel)

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapRecognizer)

        textField.addTarget(self, action: #selector(handleEditingChanged), for: .editingChanged)

        handleRequired()
        handleInteractionState()
        handleInteractionStateStyle()
        handleFeedbackStyle()
        handleTextFieldType()
    }

    private func addTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func addTextField() {
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        updateTextFieldHeightConstraint()
    }

    private func updateTextFieldHeightConstraint() {
        textFieldHeightConstraint = textField.heightAnchor.constraint(equalToConstant: size.value)
        textFieldHeightConstraint?.isActive = true
    }

    private func addStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            stackView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

extension TextField {

    @objc private func handleTap() {
        becomeFirstResponder()
    }

    @objc private func handleEditingChanged() {
        delegate?.natTextFieldEditingChanged?(self)
    }

    private func handleInteractionState() {
        textField.isEnabled = self.interactionState.isUserInteractionEnabled
        iconButtonGeneral.isUserInteractionEnabled = self.interactionState.isUserInteractionEnabled
        iconButtonVisibility.isUserInteractionEnabled = self.interactionState.isUserInteractionEnabled
    }

    private func handleInteractionStateStyle() {
        textField.borderWidth = interactionState.borderWidth
        textField.borderColor = interactionState.borderColor
        textField.textColor = interactionState.textColor
        textField.backgroundColor = interactionState.textFieldBackgroundColor
        textField.tintColor = interactionState.textFieldTintColor
        textField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                             attributes: [NSAttributedString.Key.foregroundColor:
                                                                            interactionState.placeholderTextColor])

        titleLabel.textColor = interactionState.titleTextColor
        helperLabel.textColor = interactionState.helperLabelTextColor
        iconButtonGeneral.configure(iconColor: interactionState.iconColor)
        iconButtonVisibility.tintColor = interactionState.iconColor

        helperLabel.text = helper
    }

    private func handleFeedbackStyle() {
        if state == .none {
            handleInteractionStateStyle()
            feedbackIconImageView.isHidden = true
            return
        }

        textField.borderWidth = state.borderWidth
        textField.borderColor = state.tintColor
        textField.tintColor = state.tintColor
        titleLabel.textColor = state.tintColor
        helperLabel.textColor = state.tintColor
        helperLabel.text = helper

        stackView.spacing = getTokenFromTheme(\.sizeMicro)
        feedbackIconImageView.image = state.helperIcon
        feedbackIconImageView.contentMode = .scaleAspectFit
        feedbackIconImageView.tintedColor = state.tintColor
        feedbackIconImageView.isHidden = false
    }

    private func handleTextFieldType() {
        textField.keyboardType = type.keyboard
        textField.autocorrectionType = type.autoCorrection
        textField.autocapitalizationType = type.capitalization
        textField.isSecureTextEntry = type.secureTextEntry
    }

    private func handleRequired() {
        if required {
            guard let title = title else { return }
            if title.last != "*" {
                self.title?.append("*")
            }
        }
    }

    private func addIconButtonGeneral() {
        addSubview(iconButtonGeneral)
        iconButtonGeneral.centerYAnchor.constraint(equalTo: textField.centerYAnchor).isActive = true
        iconButtonGeneral.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -12).isActive = true
    }

    private func addActionImage() {
        addSubview(actionImageView)
        actionImageView.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -0.5).isActive = true
        actionImageView.topAnchor.constraint(equalTo: textField.topAnchor, constant: 2).isActive = true
        actionImageView.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: -2).isActive = true
        actionImageView.widthAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeLarge)).isActive = true
    }

    public func showVisibilityIcon() {
        if self.type.secureTextEntry {
            if self.subviews.contains(iconButtonGeneral) {
                self.iconButtonGeneral.removeFromSuperview()
            }

            addSubview(iconButtonVisibility)
            textField.fitPaddingToIconButton()

            let constraints = [
                iconButtonVisibility.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
                iconButtonVisibility.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -12)
            ]
            NSLayoutConstraint.activate(constraints)
        }
    }

    public func hideVisibilityIcon() {
        if self.subviews.contains(iconButtonVisibility) {
            self.iconButtonVisibility.removeFromSuperview()
        }
    }

    internal func setIconVisibility() {
        if iconVisibility == AssetsPath.iconOutlinedActionVisibility.rawValue {
            iconVisibility = AssetsPath.iconOutlinedActionVisibilityOff.rawValue
            iconButtonVisibility.configure(iconImage: iconVisibility)
            self.textField.isSecureTextEntry = false
        } else {
            iconVisibility = AssetsPath.iconOutlinedActionVisibility.rawValue
            iconButtonVisibility.configure(iconImage: iconVisibility)
            self.textField.isSecureTextEntry = true
        }
    }
}

extension TextField: UITextFieldDelegate {

    // MARK: - Delegates

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self.isEditing = true
        delegate?.natTextFieldDidBeginEditing?(self)
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        self.isEditing = false
        delegate?.natTextFieldDidEndEditing?(self)
        if let isEmpty = textField.text?.isEmpty, !isEmpty {
            self.interactionState = .filled
        }
    }

    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return delegate?.natTextFieldShouldBeginEditing?(self) ?? true
    }

    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        return delegate?.natTextField?(self, changeCharInRange: range, string: string) ?? true
    }
}

extension TextField {
    // MARK: - Public Methods

    /// Sets the textField title, displayed above the textField box
    /// - Parameter title: A string with the text for the title
    public func configure(title: String) {
        self.title = title
    }

    /// Sets the textField placeholder, a hint text displayed inside the textField box when it is empy
    /// - Parameter placeholder: A string with the text for the placeholder
    public func configure(placeholder: String) {
        self.placeholder = placeholder
    }

    /// Sets the textField size, which changes it's height
    /// - Parameter size: An option from `TextField.Size` enum
    public func configure(size: Size) {
        self.size = size
    }

    /// Sets the textField type, which changes it's configuration for keyboard, secure text, capitalization and autocorrection
    /// - Parameter type: An option from `TextFieldType`
    public func configure(type: TextFieldType) {
        self.type = type
    }

    /// Sets the state of the textField and a text to describe the state
    /// - Parameters:
    ///   - state: An option from `TextField.FeedbackState`: error, success or none
    ///   - text: A string with the text to be displayed below the textField box. If the state is `error` or `success`,
    ///    the text will have a small icon next to it. If the state is  `none`, the text will be displayed as a helper text.
    public func configure(state: FeedbackState, with text: String?) {
        self.state = state
        self.helper = text
    }

    /// Sets if the textField is required, when its filling is mandatory
    /// - Parameter required: A boolean indicating if the textField is required
    public func configure(required: Bool) {
        self.required = required
    }

    /// Sets if the textField is enabled or disabled
    /// - Parameter isEnabled: A boolean indicating if the textField is enabled
    public func configure(isEnabled: Bool) {
        self.isEnabled = isEnabled
    }

    /// Sets if the textField is read only
    /// - Parameter readOnly: A boolean indicating if the textField is read only
    public func configure(readOnly: Bool) {
        self.readOnly = readOnly
    }

    /// Sets a helper text to be displayed below the textField box
    /// - Parameter helperText: A string with the helper text
    public func configure(helperText: String) {
        self.helper = helperText
    }

    /// Sets an icon to be displayed inside the textField box, aligned with it's right side, and the action to be executed when the icon is tapped.
    /// - Parameters:
    ///   - icon: An icon from NatDSIcons, which is sent as a string. Example: `getIcon(.outlinedDefaultMockup)`
    ///   - action: A block of code to be executed when the icon receives a tap.
    public func configure(icon: String?, with action: @escaping () -> Void) {
        configureRemoveAction()
        hideVisibilityIcon()
        textField.fitPaddingToIconButton()
        addIconButtonGeneral()
        iconButtonGeneral.configure(action: action)

        if icon == nil {
            iconButtonGeneral.iconView.shouldShowDefaultIcon = true
        } else {
            iconButtonGeneral.configure(icon: icon)
        }
    }

    /// Sets a local image to be displayed inside the textField box, aligned with the right side, and the action to be executed when it is tapped.
    /// - Parameters:
    ///   - image: An UIImage to be displayed in the textField right edge
    ///   - action: A block of code to be executed when the image is tapped
    public func configure(image: UIImage?, with action: @escaping () -> Void) {
        configureRemoveAction()
        hideVisibilityIcon()
        textField.fitPaddingToImage()
        addActionImage()
        actionImageView.image = image
        actionImageView.isClickable = true
        actionImageView.callback = action
    }

    /// Sets a remote image to be displayed inside the textField box, aligned with the right edge, and the action to be executed when it is tapped.
    /// - Parameters:
    ///   - remoteImageURL: A URL that contains the remote address to the image. Example: `URL(string: "http://myimage")!`
    ///   - action: A block of code the be executed when the image is tapped
    public func configure(remoteImageURL: URL, with action: @escaping () -> Void) {
        configureRemoveAction()
        hideVisibilityIcon()
        textField.fitPaddingToImage()
        addActionImage()
        actionImageView.load(url: remoteImageURL)
        actionImageView.isClickable = true
        actionImageView.callback = action
    }

    /// Removes the action item, whether it's an icon or an image
    public func configureRemoveAction() {
        if self.subviews.contains(iconButtonGeneral) {
            iconButtonGeneral.removeFromSuperview()
        }
        if self.subviews.contains(actionImageView) {
            actionImageView.removeFromSuperview()
        }
    }

    /// Sets the eye icon to show and hide the textField content. It can only be used if the textField has the `password` type.
    public func configureShowVisibilityIcon() {
        showVisibilityIcon()
    }

    /// Removes the eye icon from `password` type textFields.
    public func configureRemoveVisibilityIcon() {
        hideVisibilityIcon()
    }
}
