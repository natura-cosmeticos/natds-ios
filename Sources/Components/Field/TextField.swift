public class TextField: UIView {

    public enum State {
        case enable
        case active
        case error(String?)
    }

    public var state: State = .enable {
        didSet {
            handleState()
        }
    }

    public var info: String? {
        get { infoLabel.text }
        set { infoLabel.text = newValue }
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

    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.button
        return label
    }()

    private lazy var textField: Field = {
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
        _ = textField.becomeFirstResponder()
    }

    @objc func handleEditingDidBegin() {
        self.state = .active
    }

    @objc func handleEditingDidEnd() {
        self.state = .enable
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
            infoLabel.textColor = Colors.Content.mediumEmphasis
            helperLabel.textColor = Colors.Content.mediumEmphasis

        case .error(let text):
            textField.borderWidth = 2
            textField.borderColor = Colors.Feedback.alert
            infoLabel.textColor = Colors.Feedback.alert
            helperLabel.textColor = .red
            helperLabel.attributedText = text?.withIcon(Icon.outlinedActionCancel.rawValue)
        }
    }
}

extension String {

    func withIcon(_ icon: String) -> NSAttributedString {
        let fullText = "\(icon) \(self)"

        let attrText = NSMutableAttributedString(string: fullText)

        let messageRange = (fullText as NSString).range(of: self)
        let messageAttr: [NSAttributedString.Key: Any] = [
            .font: Fonts.caption,
            .baselineOffset: 1
        ]

        attrText.addAttributes(messageAttr, range: messageRange)

        let iconParagraphStyle = NSMutableParagraphStyle()
        iconParagraphStyle.maximumLineHeight = Fonts.caption.lineHeight

        let iconRange = (fullText as NSString).range(of: icon)
        let iconAttr: [NSAttributedString.Key: Any] = [
            .font: UIFont.iconFont(ofSize: Fonts.caption.lineHeight),
            .paragraphStyle: iconParagraphStyle,
            .baselineOffset: -2
        ]

        attrText.addAttributes(iconAttr, range: iconRange)

        return attrText
    }
}

extension String {

    public func withIcon(icon: String) -> NSAttributedString {
        let fullMessage = "\(icon) \(self)"
        let messageLenght = self.count
        let iconLenght = 1

        let attributedString = NSMutableAttributedString(string: fullMessage)

        attributedString.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.iconFont(ofSize: 20),
                                      range: NSRange(location: 0, length: iconLenght))

        attributedString.addAttribute(NSAttributedString.Key.font,
                                      value: Fonts.button,
                                      range: NSRange(location: 2, length: messageLenght))

        attributedString.addAttribute(NSAttributedString.Key.baselineOffset,
                                      value: 5,
                                      range: NSRange(location: 2, length: messageLenght))

        return attributedString
    }

}
