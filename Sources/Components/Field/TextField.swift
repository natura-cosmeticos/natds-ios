public class TextField: UIView {

    enum State {
        case enable
        case active
        case error
    }

    public enum TextFieldType {
        case text
        case number
    }

    public var info: String? {
        get { infoLabel.text }
        set { infoLabel.text = newValue }
    }

    public var text: String? {
        get { textField.text }
        set { textField.text = newValue }
    }

    public var placeholder: String? {
        get { textField.placeholder }
        set { textField.placeholder = newValue}
    }

    public var delegate: UITextFieldDelegate? {
        get { textField.delegate }
        set { textField.delegate = newValue }
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

    private(set) var state: State = .enable {
        didSet {
            handleState()
        }
    }

    private var isActive: Bool = false {
        didSet {
            changeState()
        }
    }

    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.button
        return label
    }()

    private(set) lazy var textField: Field = {
        let field = Field()
        return field
    }()

    private lazy var helperLabel: UILabel = {
        let label = UILabel()
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

    func equals(textField: UITextField) -> Bool {
        return self.textField == textField
    }
}

extension TextField {

    private func setup() {
        backgroundColor = .clear

        addInfoLabel()
        addTextField()
        addHelperLabel()

        textField.addTarget(self, action: #selector(handleEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(handleEditingDidEnd), for: .editingDidEnd)

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapRecognizer)

        handleState()
        handleTextFieldType()
    }

    private func addInfoLabel() {
        addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            infoLabel.topAnchor.constraint(equalTo: topAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func addTextField() {
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            textField.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 4),
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

    @objc func handleTap() {
        becomeFirstResponder()
    }

    @objc func handleEditingDidBegin() {
        self.isActive = true
    }

    @objc func handleEditingDidEnd() {
        self.isActive = false
    }

    private func handleState() {
        switch state {
        case .enable:
            textField.borderWidth = 1
            textField.borderColor = Colors.lowEmphasis
            infoLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.text = helper

        case .active:
            textField.borderWidth = 2
            textField.borderColor = Colors.primary
            textField.tintColor = Colors.primary
            infoLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.text = helper

        case .error:
            textField.borderWidth = 2
            textField.borderColor = Colors.Feedback.alert
            textField.tintColor = Colors.Feedback.alert
            infoLabel.textColor = Colors.Feedback.alert
            helperLabel.textColor = Colors.Feedback.alert
            helperLabel.attributedText = error?.withIcon(Icon.outlinedActionCancel.rawValue)
        }
    }

    private func handleTextFieldType() {
        switch self.type {
        case .text:
            self.textField.autocapitalizationType = .none
            self.textField.keyboardType = .default
            self.textField.autocorrectionType = .yes

        case .number:
            self.textField.autocapitalizationType = .none
            self.textField.keyboardType = .numberPad
            self.textField.autocorrectionType = .no
        }
    }

    private func changeState() {
        if error != nil {
            self.state = .error
        } else {
            self.state = isActive
                ? .active
                : .enable
        }
    }
}
