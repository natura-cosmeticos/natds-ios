//
///**
// DOCS
// */
//
//public class TextFieldMultiline: UIView {
//    
//    public let type: TextFieldType = .multiline
//    
//    /// Label text that is always displayed above textfield
//    public var title: String? {
//        get { titleLabel.text }
//        set { titleLabel.text = newValue }
//    }
//    
//    /// The text from the textfield
//    public var text: String? {
//        get { textField.text }
//        set {
//            textField.text = newValue
//            interactionState = text != nil ? .filled : .enabled
//        }
//    }
//    
//    /// Hint text to display when the textfield is empty
//    public var placeholder: String? {
//        get { textField.placeholder }
//        set { textField.placeholder = newValue}
//    }
//    
//    /// Hint text that is always displayed below textfield
//    public var helper: String? {
//        didSet {
//            helperLabel.text = helper
//        }
//    }
//    
//    public var required: Bool = false {
//        didSet {
//            handleRequired()
//        }
//    }
//    
//    public var isEnabled: Bool = true {
//        didSet {
//            self.interactionState = isEnabled ? .enabled : .disabled
//        }
//    }
//
//    public weak var delegate: TextFieldDelegate?
//    
//    private var isEditing: Bool = false {
//        didSet {
//            self.interactionState = isEditing ? .active : .enabled
//        }
//    }
//    
//    private(set) var interactionState: InteractionState = .enabled {
//        didSet {
//            handleInteractionState()
//            handleInteractionStateStyle()
//        }
//    }
//    
//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.font = NatFonts.font(ofSize: .button, withWeight: .medium)
//        label.numberOfLines = 2
//        return label
//    }()
//
//    private(set) lazy var textField: Field = {
//        let field = Field()
//        field.delegate = self
//        return field
//    }()
//
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .fillProportionally
//        stackView.axis = .horizontal
//        stackView.alignment = .top
//
//        return stackView
//    }()
//
//    private lazy var helperLabel: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
//        label.font = NatFonts.font(ofSize: .caption, withWeight: .regular)
//        return label
//    }()
//    
//
//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    public override func layoutSubviews() {
//        super.layoutSubviews()
//        setup()
//    }
//}
//
//public extension TextFieldMultiline {
//
//    @discardableResult
//    override func becomeFirstResponder() -> Bool {
//        return textField.becomeFirstResponder()
//    }
//
//    @discardableResult
//    override func resignFirstResponder() -> Bool {
//        return textField.resignFirstResponder()
//    }
//}
//
//extension TextFieldMultiline {
//
//    private func setup() {
//        backgroundColor = .clear
//
//        addTitleLabel()
//        addTextField()
//        addStackView()
//        stackView.addArrangedSubview(feedbackIconImageView)
//        stackView.addArrangedSubview(helperLabel)
//
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        addGestureRecognizer(tapRecognizer)
//
//        textField.addTarget(self, action: #selector(handleEditingChanged), for: .editingChanged)
//
//        handleRequired()
//        handleInteractionState()
//        handleInteractionStateStyle()
//        handleFeedbackStyle()
//        handleTextFieldType()
//        showVisibilityIcon()
//    }
//
//    private func addTitleLabel() {
//        addSubview(titleLabel)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        let constraints = [
//            titleLabel.topAnchor.constraint(equalTo: topAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
//        ]
//
//        NSLayoutConstraint.activate(constraints)
//    }
//
//    private func addTextField() {
//        addSubview(textField)
//        textField.translatesAutoresizingMaskIntoConstraints = false
//
//        let constraints = [
//            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
//            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
//            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
//            textField.heightAnchor.constraint(equalToConstant: size.value)
//        ]
//
//        NSLayoutConstraint.activate(constraints)
//    }
//
//    private func addStackView() {
//        addSubview(stackView)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        let constraints = [
//            stackView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4),
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
//        ]
//
//        NSLayoutConstraint.activate(constraints)
//    }
//}
//
//extension TextFieldMultiline {
//
//    @objc private func handleTap() {
//        becomeFirstResponder()
//    }
//
//    @objc private func handleEditingChanged() {
//        delegate?.natTextFieldEditingChanged?(self)
//    }
//    
//    private func handleInteractionState() {
//        if interactionState == .disabled || interactionState == .readOnly {
//            textField.isEnabled = false
//        } else {
//            textField.isEnabled = true
//    }
//    
//    private func handleInteractionStateStyle() {
//        switch interactionState {
//        case .enabled:
//            textField.borderWidth = 1
//            textField.borderColor = getUIColorFromTokens(\.colorLowEmphasis)
//            titleLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
//            helperLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
//            helperLabel.text = helper
//            textField.textColor = getUIColorFromTokens(\.colorHighEmphasis)
//            textField.backgroundColor = .clear
//            textField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
//                                                                 attributes: [NSAttributedString.Key.foregroundColor:
//                                                                                getUIColorFromTokens(\.colorMediumEmphasis)])
//            
//        case .active:
//            textField.borderWidth = 2
//            textField.borderColor = getUIColorFromTokens(\.colorPrimary)
//            textField.tintColor = getUIColorFromTokens(\.colorPrimary)
//            titleLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
//            helperLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
//            helperLabel.text = helper
//            textField.textColor = getUIColorFromTokens(\.colorHighEmphasis)
//            textField.backgroundColor = .clear
//            textField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
//                                                                 attributes: [NSAttributedString.Key.foregroundColor:
//                                                                                getUIColorFromTokens(\.colorMediumEmphasis)])
//            
//        case .readOnly:
//            textField.borderWidth = 1
//            textField.borderColor = getUIColorFromTokens(\.colorLowEmphasis)
//            titleLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
//            helperLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
//            textField.backgroundColor = getUIColorFromTokens(\.colorLowEmphasis).withAlphaComponent(0.25)
//            helperLabel.text = helper
//            textField.textColor = getUIColorFromTokens(\.colorHighEmphasis)
//            
//        case .disabled:
//            textField.borderWidth = 1
//            textField.borderColor = getUIColorFromTokens(\.colorLowEmphasis)
//            textField.textColor = getUIColorFromTokens(\.colorLowEmphasis)
//            titleLabel.textColor = getUIColorFromTokens(\.colorLowEmphasis)
//            helperLabel.textColor = getUIColorFromTokens(\.colorLowEmphasis)
//            helperLabel.text = helper
//            textField.backgroundColor = .clear
//            textField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
//                                                                 attributes: [NSAttributedString.Key.foregroundColor:
//                                                                                getUIColorFromTokens(\.colorLowEmphasis)])
//            
//        case .filled:
//            textField.borderWidth = 1
//            textField.borderColor = getUIColorFromTokens(\.colorHighEmphasis)
//            titleLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
//            helperLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
//            helperLabel.text = helper
//            textField.textColor = getUIColorFromTokens(\.colorHighEmphasis)
//            textField.backgroundColor = .clear
//        }
//    }
//
//    private func handleTextFieldType() {
//        self.textField.keyboardType = type.keyboard
//        self.textField.autocorrectionType = type.autoCorrection
//        self.textField.autocapitalizationType = type.capitalization
//        self.textField.isSecureTextEntry = type.secureTextEntry
//        if type.needsRedraw {
//            self.setNeedsDisplay()
//        }
//    }
//    
//    private func handleRequired() {
//        if required {
//            guard let title = title else { return }
//            if title.last != "*" {
//                self.title?.append("*")
//            }
//        }
//    }
//    
//}
//
//extension TextField: UITextFieldDelegate {
//
//    // MARK: - Delegates
//    
//    public func textFieldDidBeginEditing(_ textField: UITextField) {
//        self.isEditing = true
//        delegate?.natTextFieldDidBeginEditing?(self)
//    }
//
//    public func textFieldDidEndEditing(_ textField: UITextField) {
//        self.isEditing = false
//        delegate?.natTextFieldDidEndEditing?(self)
//        if let isEmpty = textField.text?.isEmpty, !isEmpty {
//            self.interactionState = .filled
//        }
//    }
//
//    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        return delegate?.natTextFieldShouldBeginEditing?(self) ?? true
//    }
//
//    public func textField(_ textField: UITextField,
//                          shouldChangeCharactersIn range: NSRange,
//                          replacementString string: String) -> Bool {
//        return delegate?.natTextField?(self, changeCharInRange: range, string: string) ?? true
//    }
//}
//
//extension TextField {
//    // MARK: - Public Methods
//    
//    public func configure(size: Size) {
//        self.size = size
//    }
//    
//    public func configure(feedback state: FeedbackState, with text: String?) {
//        self.feedbackState = state
//        self.helper = text
//    }
//    
//    public func configure(required: Bool) {
//        self.required = required
//    }
//    
//    public func configure(isEnabled: Bool) {
//        self.isEnabled = isEnabled
//    }
//    
//    public func configure(readOnly: Bool) {
//        self.readOnly = readOnly
//    }
//    
//    public func configure(helperText: String) {
//        self.helper = helperText
//    }
//    
//    public func configure(icon: String?, with action: @escaping () -> Void) {
//        configureRemoveAction()
//        hideVisibilityIcon()
//        textField.fitPaddingToPasswordButton()
//        addIconButtonGeneral()
//        iconButtonGeneral.configure(action: action)
//
//        if icon == nil {
//            iconButtonGeneral.iconView.shouldShowDefaultIcon = true
//        } else {
//            iconButtonGeneral.configure(icon: icon)
//        }
//    }
//    
//    public func configure(image: UIImage?, with action: @escaping () -> Void) {
//        configureRemoveAction()
//        hideVisibilityIcon()
//        textField.fitPaddingToPasswordButton()
//        addIconButtonGeneral()
//        addActionImage()
//        actionImageView.image = image
//        iconButtonGeneral.configure(action: action)
//        iconButtonGeneral.alpha = 0
//    }
//    
//    public func configure(remoteImageURL: URL, with action: @escaping () -> Void) {
//        configureRemoveAction()
//        hideVisibilityIcon()
//        textField.fitPaddingToPasswordButton()
//        addIconButtonGeneral()
//        addActionImage()
//        actionImageView.load(url: remoteImageURL)
//        iconButtonGeneral.configure(action: action)
//        iconButtonGeneral.alpha = 0
//    }
//    
//    public func configureRemoveAction() {
//        if self.subviews.contains(iconButtonGeneral) {
//            iconButtonGeneral.removeFromSuperview()
//        }
//        if self.subviews.contains(actionImageView) {
//            actionImageView.removeFromSuperview()
//        }
//    }
//    
//    public func configureShowVisibilityIcon() {
//        showVisibilityIcon()
//    }
//    
//    public func configureRemoveVisibilityIcon() {
//        hideVisibilityIcon()
//    }
//}
