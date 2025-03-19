//
//  GaYaField.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 12/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

public final class GaYaField: UITextField {

    let contentFont: UIFont = GaYaFonts.font(ofSize: getComponentAttributeFromTheme(\.textFieldContentFontSize),
                                            withWeight: getComponentAttributeFromTheme(\.textFieldContentPrimaryFontWeight),
                                            withFamily: getComponentAttributeFromTheme(\.textFieldContentPrimaryFontFamily))
    let contentLetterSpacing = getComponentAttributeFromTheme(\.textFieldContentLetterSpacing)
    let contentLineHeight = getComponentAttributeFromTheme(\.textFieldContentLineHeight)
    
    var theme:AvailableTheme = .none

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
            .apply(font: contentFont)
            .apply(kernValue: contentLetterSpacing)
            .apply(paragraphStyle: contentParagraphStyle)

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

    convenience init(theme:AvailableTheme = .none) {
        self.init(frame: .zero)
        
        self.theme = theme
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        font = contentFont
        textColor = getUIColorFromTokens(\.colorHighEmphasis)
        //layer.cornerRadius = 4
        
        layer.borderWidth = borderWidth
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()

        if getComponentAttributeFromTheme(\.isInputRounded) {
            self.layer.cornerRadius = self.frame.height / 2
        } else {
            self.layer.cornerRadius = getComponentAttributeFromTheme(\.textFieldBorderRadius)
        }
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

    public override func caretRect(for position: UITextPosition) -> CGRect {
        if inputView != nil {
            return .zero
        }

        return super.caretRect(for: position)
    }

    func fitPaddingToIconButton() {
        padding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 40)
    }

    func fitPaddingToImage() {
        padding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 80)
    }
}

