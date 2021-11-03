    // swiftlint:disable line_length
public final class NatField: UITextField {

    let contentFont: UIFont = NatFonts.font(ofSize: getComponentAttributeFromTheme(\.textFieldContentFontSize),
                                            withWeight: getComponentAttributeFromTheme(\.textFieldContentPrimaryFontWeight),
                                            withFamily: getComponentAttributeFromTheme(\.textFieldContentPrimaryFontFamily))
    let contentLetterSpacing = getComponentAttributeFromTheme(\.textFieldContentLetterSpacing)
    let contentLineHeight = getComponentAttributeFromTheme(\.textFieldContentLineHeight)

    lazy var contentParagraphStyle: NSMutableParagraphStyle = {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = contentLineHeight
        return paragraphStyle
    }()

    public override var placeholder: String? {
        didSet {
            let attrPlaceholder = NSMutableAttributedString(string: placeholder ?? "")
                .apply(font: contentFont)
                .apply(kernValue: contentLetterSpacing)
                .apply(foregroundColor: getUIColorFromTokens(\.colorMediumEmphasis))
                .apply(paragraphStyle: contentParagraphStyle)

            attributedPlaceholder = attrPlaceholder
        }
    }

    public override var text: String? {
        didSet {
            let attrText = NSMutableAttributedString(string: text ?? "")
            attrText.apply(kernValue: contentLetterSpacing)
            attrText.apply(paragraphStyle: contentParagraphStyle)

            attributedText = attrText
        }
    }

    var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    var borderColor: UIColor = getUIColorFromTokens(\.colorLowEmphasis) {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    private var padding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = contentFont
        textColor = getUIColorFromTokens(\.colorHighEmphasis)
        layer.cornerRadius = 4
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    func fitPaddingToIconButton() {
        padding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 40)
    }

    func fitPaddingToImage() {
        padding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 80)
    }
}
