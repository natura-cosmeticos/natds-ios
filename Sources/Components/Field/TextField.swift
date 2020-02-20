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

    private lazy var helperLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = Fonts.caption
        return label
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
        addHelperLabel()

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapRecognizer)

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

    private func addHelperLabel() {
        addSubview(helperLabel)
        helperLabel.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            helperLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4),
            helperLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            helperLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            helperLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

extension TextField {

    @objc private func handleTap() {
        becomeFirstResponder()
    }

    private func handleState() {
        switch state {
        case .enable:
            textField.borderWidth = 1
            textField.borderColor = Colors.lowEmphasis
            titleLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.text = helper

        case .active:
            textField.borderWidth = 2
            textField.borderColor = Colors.primary
            textField.tintColor = Colors.primary
            titleLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.text = helper

        case .error:
            textField.borderWidth = 2
            textField.borderColor = Colors.Feedback.alert
            textField.tintColor = Colors.Feedback.alert
            titleLabel.textColor = Colors.Feedback.alert
            helperLabel.textColor = Colors.Feedback.alert
            helperLabel.attributedText = error?.withIcon(Icon.outlinedActionCancel.rawValue)
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
        delegate?.textFieldDidBeginEditing?(self)
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        self.isEditing = false
        delegate?.textFieldDidEndEditing?(self)
    }

    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldBeginEditing?(self) ?? true
    }

    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        return delegate?.textField?(self, changeCharInRange: range, string: string) ?? true
    }
}
