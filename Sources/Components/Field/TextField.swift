public class TextField: UIView {

    enum State {
        case enable
        case active
        case error
    }

    public var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }

    public var text: String? {
        get { textField.text }
        set { textField.text = newValue }
    }

    public var placeholder: String? {
        get { textField.placeholder }
        set { textField.placeholder = newValue}
    }

    public var helper: String? {
        didSet {
            helperLabel.text = helper
        }
    }

    public var error: String? {
        didSet {
            changeState()
        }
    }

    public var type: TextFieldType = .text {
        didSet {
            handleTextFieldType()
        }
    }

    public weak var delegate: TextFieldDelegate?

    private(set) var state: State = .enable {
        didSet {
            handleState()
        }
    }

    private var isEditing: Bool = false {
        didSet {
            changeState()
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.button
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
        stackView.spacing = 4

        return stackView
    }()

    private lazy var helperLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = Fonts.caption
        return label
    }()

    private lazy var iconView: IconView = {
        let iconView = IconView(fontSize: Fonts.caption.pointSize)
        iconView.icon = Icon.outlinedActionCancel
        iconView.tintColor = Colors.Feedback.alert

        return iconView
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
        backgroundColor = .clear

        addTitleLabel()
        addTextField()
        addStackView()
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(helperLabel)

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapRecognizer)

        textField.addTarget(self, action: #selector(handleEditingChanged), for: .editingChanged)

        handleState()
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
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 56)
        ]

        NSLayoutConstraint.activate(constraints)
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

    private func handleState() {
        switch state {
        case .enable:
            textField.borderWidth = 1
            textField.borderColor = Colors.Content.lowEmphasis
            titleLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.text = helper
            iconView.isHidden = true

        case .active:
            textField.borderWidth = 2
            textField.borderColor = Colors.primary
            textField.tintColor = Colors.primary
            titleLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.text = helper
            iconView.isHidden = true

        case .error:
            textField.borderWidth = 2
            textField.borderColor = Colors.Feedback.alert
            textField.tintColor = Colors.Feedback.alert
            titleLabel.textColor = Colors.Feedback.alert
            helperLabel.textColor = Colors.Feedback.alert
            helperLabel.text = error ?? ""
            iconView.tintColor = Colors.Feedback.alert
            iconView.isHidden = false
        }
    }

    private func handleTextFieldType() {
        self.textField.keyboardType = type.keyboard
        self.textField.autocorrectionType = type.autoCorrection
        self.textField.autocapitalizationType = type.capitalization
    }

    private func changeState() {
        if error != nil {
            self.state = .error
        } else {
            self.state = isEditing ? .active : .enable
        }
    }
}

extension TextField: UITextFieldDelegate {

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self.isEditing = true
        delegate?.natTextFieldDidBeginEditing?(self)
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        self.isEditing = false
        delegate?.natTextFieldDidEndEditing?(self)
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
