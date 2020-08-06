class Field: UITextField {

    override var placeholder: String? {
        didSet {
            let attrPlaceholder = NSMutableAttributedString(string: placeholder ?? "")
                .apply(font: NatFonts.font(ofSize: .body1, withWeight: .regular))
                .apply(foregroundColor: getTheme().colors.mediumEmphasis)

            attributedPlaceholder = attrPlaceholder
        }
    }

    var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    var borderColor: UIColor = getTheme().colors.lowEmphasis {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    private let padding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = NatFonts.font(ofSize: .body1, withWeight: .regular)
        layer.cornerRadius = 4
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
