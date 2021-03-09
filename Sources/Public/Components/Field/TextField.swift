/**
 TextField is a class that represents a component from the design system.
 The textField styles, keyboards, capitalization and autocorrection properties changes according to the chosen type.

 This TextField has 4 types:
 - Text
 - Name
 - Number
 - Password

 Example of usage:
 
        textField.type = .text
        textField.type = .name
        textField.type = .number
        textField.type = .password(keyboardType: .numberPad
 
 This TextField has 3 States:
 - enable
 - active
 - error

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
    
    /// Label text that is always displayed above textfield
    public var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    /// The text from the textfield
    public var text: String? {
        get { textField.text }
        set {
            textField.text = newValue
            interactionState = text != nil ? .filled : .enabled
        }
    }
    
    /// Hint text to display when the textfield is empty
    public var placeholder: String? {
        get { textField.placeholder }
        set { textField.placeholder = newValue}
    }
    
    /// Hint text that is always displayed below textfield
    public var helper: String? {
        didSet {
            helperLabel.text = helper
        }
    }
    
    /// Text that alerts about an error
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
    
    public var required: Bool = false {
        didSet {
            handleRequired()
        }
    }
    
    public var readOnly: Bool = false {
        didSet {
            self.interactionState = readOnly ? .readOnly : .enabled
        }
    }
    
    public var isEnabled: Bool = true {
        didSet {
            self.interactionState = isEnabled ? .enabled : .disabled
        }
    }
    
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

    private(set) lazy var textField: Field = {
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
    
    private lazy var iconCheck: UIImage? = {
        let icon = AssetsPath.iconOutlinedActionCheck.rawValue
        return icon
    }()

    private lazy var iconCancel: UIImage? = {
        let icon = AssetsPath.iconOutlinedActionCancel.rawValue
        return icon
    }()

    private lazy var iconButtonVisibility: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault)
        iconButton.configure(iconImage: iconVisibility)
        iconButton.configure {
            self.setIconVisibility()
        }
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeStandard)).isActive = true
        iconButton.widthAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeStandard)).isActive = true

        return iconButton
    }()
    
    private lazy var iconButtonGeneral: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeStandard)).isActive = true
        iconButton.widthAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeStandard)).isActive = true
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

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
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
        switch interactionState {
        case .enabled:
            textField.borderWidth = 1
            textField.borderColor = getUIColorFromTokens(\.colorLowEmphasis)
            titleLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
            helperLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
            helperLabel.text = helper
            iconButtonVisibility.tintColor = getUIColorFromTokens(\.colorHighlight)
            iconButtonGeneral.configure(iconColor: getUIColorFromTokens(\.colorHighlight))
            textField.textColor = getUIColorFromTokens(\.colorHighEmphasis)
            textField.backgroundColor = .clear
            textField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                                 attributes: [NSAttributedString.Key.foregroundColor:
                                                                                getUIColorFromTokens(\.colorMediumEmphasis)])
            
        case .active:
            textField.borderWidth = 2
            textField.borderColor = getUIColorFromTokens(\.colorPrimary)
            textField.tintColor = getUIColorFromTokens(\.colorPrimary)
            titleLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
            helperLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
            helperLabel.text = helper
            textField.textColor = getUIColorFromTokens(\.colorHighEmphasis)
            textField.backgroundColor = .clear
            textField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                                 attributes: [NSAttributedString.Key.foregroundColor:
                                                                                getUIColorFromTokens(\.colorMediumEmphasis)])
            
        case .readOnly:
            textField.borderWidth = 1
            textField.borderColor = getUIColorFromTokens(\.colorLowEmphasis)
            titleLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
            helperLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
            textField.backgroundColor = getUIColorFromTokens(\.colorLowEmphasis).withAlphaComponent(0.25)
            helperLabel.text = helper
            textField.textColor = getUIColorFromTokens(\.colorHighEmphasis)
            iconButtonVisibility.tintColor = getUIColorFromTokens(\.colorHighEmphasis)
            iconButtonGeneral.configure(iconColor: getUIColorFromTokens(\.colorHighEmphasis))
            
        case .disabled:
            textField.borderWidth = 1
            textField.borderColor = getUIColorFromTokens(\.colorLowEmphasis)
            textField.textColor = getUIColorFromTokens(\.colorLowEmphasis)
            titleLabel.textColor = getUIColorFromTokens(\.colorLowEmphasis)
            helperLabel.textColor = getUIColorFromTokens(\.colorLowEmphasis)
            helperLabel.text = helper
            iconButtonVisibility.tintColor = getUIColorFromTokens(\.colorLowEmphasis)
            iconButtonGeneral.configure(iconColor: getUIColorFromTokens(\.colorLowEmphasis))
            textField.backgroundColor = .clear
            textField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                                 attributes: [NSAttributedString.Key.foregroundColor:
                                                                                getUIColorFromTokens(\.colorLowEmphasis)])
            
        case .filled:
            textField.borderWidth = 1
            textField.borderColor = getUIColorFromTokens(\.colorHighEmphasis)
            titleLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
            helperLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
            helperLabel.text = helper
            iconButtonVisibility.tintColor = getUIColorFromTokens(\.colorHighEmphasis)
            iconButtonGeneral.configure(iconColor: getUIColorFromTokens(\.colorHighEmphasis))
            textField.textColor = getUIColorFromTokens(\.colorHighEmphasis)
            textField.backgroundColor = .clear
        }
    }
    
    private func handleFeedbackStyle() {
        switch state {
        case .error:
            textField.borderWidth = 2
            textField.borderColor = getUIColorFromTokens(\.colorAlert)
            textField.tintColor = getUIColorFromTokens(\.colorAlert)
            titleLabel.textColor = getUIColorFromTokens(\.colorAlert)
            helperLabel.textColor = getUIColorFromTokens(\.colorAlert)
            helperLabel.text = helper
            stackView.spacing = getTokenFromTheme(\.sizeMicro)
            feedbackIconImageView.image = iconCancel
            feedbackIconImageView.contentMode = .scaleAspectFit
            feedbackIconImageView.tintedColor = getUIColorFromTokens(\.colorAlert)
            feedbackIconImageView.isHidden = false
            
        case .success:
            textField.borderWidth = 1
            textField.borderColor = getUIColorFromTokens(\.colorSuccess)
            textField.tintColor = getUIColorFromTokens(\.colorSuccess)
            titleLabel.textColor = getUIColorFromTokens(\.colorSuccess)
            helperLabel.textColor = getUIColorFromTokens(\.colorSuccess)
            helperLabel.text = helper
            stackView.spacing = getTokenFromTheme(\.sizeMicro)
            feedbackIconImageView.image = iconCheck
            feedbackIconImageView.contentMode = .scaleAspectFit
            feedbackIconImageView.tintedColor = getUIColorFromTokens(\.colorSuccess)
            feedbackIconImageView.isHidden = false
            
        default:
            handleInteractionStateStyle()
            feedbackIconImageView.isHidden = true
            return
        }
    }

    private func handleTextFieldType() {
        self.textField.keyboardType = type.keyboard
        self.textField.autocorrectionType = type.autoCorrection
        self.textField.autocapitalizationType = type.capitalization
        self.textField.isSecureTextEntry = type.secureTextEntry
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
        self.iconButtonGeneral.centerYAnchor.constraint(equalTo: textField.centerYAnchor).isActive = true
        self.iconButtonGeneral.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -12).isActive = true
    }
    
    private func addActionImage() {
        addSubview(actionImageView)
        actionImageView.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        actionImageView.topAnchor.constraint(equalTo: textField.topAnchor).isActive = true
        actionImageView.bottomAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
        actionImageView.widthAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeLarge)).isActive = true
    }
    
    public func showVisibilityIcon() {
        if self.type.secureTextEntry {
            if self.subviews.contains(iconButtonGeneral) {
                self.iconButtonGeneral.removeFromSuperview()
            }
            
            addSubview(iconButtonVisibility)
            textField.fitPaddingToPasswordButton()

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
    
    public func configure(title: String) {
        self.title = title
    }
    
    public func configure(placeholder: String) {
        self.placeholder = placeholder
    }
    
    public func configure(size: Size) {
        self.size = size
    }
    
    public func configure(type: TextFieldType) {
        self.type = type
    }
    
    public func configure(state: FeedbackState, with text: String?) {
        self.state = state
        self.helper = text
    }
    
    public func configure(required: Bool) {
        self.required = required
    }
    
    public func configure(isEnabled: Bool) {
        self.isEnabled = isEnabled
    }
    
    public func configure(readOnly: Bool) {
        self.readOnly = readOnly
    }
    
    public func configure(helperText: String) {
        self.helper = helperText
    }
    
    public func configure(icon: String?, with action: @escaping () -> Void) {
        configureRemoveAction()
        hideVisibilityIcon()
        textField.fitPaddingToPasswordButton()
        addIconButtonGeneral()
        iconButtonGeneral.configure(action: action)

        if icon == nil {
            iconButtonGeneral.iconView.shouldShowDefaultIcon = true
        } else {
            iconButtonGeneral.configure(icon: icon)
        }
    }
    
    public func configure(image: UIImage?, with action: @escaping () -> Void) {
        configureRemoveAction()
        hideVisibilityIcon()
        textField.fitPaddingToPasswordButton()
        addIconButtonGeneral()
        addActionImage()
        actionImageView.image = image
        iconButtonGeneral.configure(action: action)
        iconButtonGeneral.alpha = 0
    }
    
    public func configure(remoteImageURL: URL, with action: @escaping () -> Void) {
        configureRemoveAction()
        hideVisibilityIcon()
        textField.fitPaddingToPasswordButton()
        addIconButtonGeneral()
        addActionImage()
        actionImageView.load(url: remoteImageURL)
        iconButtonGeneral.configure(action: action)
        iconButtonGeneral.alpha = 0
    }
    
    public func configureRemoveAction() {
        if self.subviews.contains(iconButtonGeneral) {
            iconButtonGeneral.removeFromSuperview()
        }
        if self.subviews.contains(actionImageView) {
            actionImageView.removeFromSuperview()
        }
    }
    
    public func configureShowVisibilityIcon() {
        showVisibilityIcon()
    }
    
    public func configureRemoveVisibilityIcon() {
        hideVisibilityIcon()
    }
}
