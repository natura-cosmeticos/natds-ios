enum DialogStyle {
    static func createLabelForTitle(title: String) -> UILabel {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .heading6, withWeight: .medium)

        let color = getUIColorFromTokens(\.colorHighEmphasis)
        let kern = getComponentAttributeFromTheme(\.heading6LetterSpacing)
        label.attributedText = createAttributedText(text: title, color: color, kern: kern)

        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }

    static func createLabelForBody(body: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = NatFonts.font(ofSize: .body1, withWeight: .regular)

        let color = getUIColorFromTokens(\.colorHighEmphasis)
        let kern = getComponentAttributeFromTheme(\.body1LetterSpacing)
        label.attributedText = createAttributedText(text: body, color: color, kern: kern)

        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }

    private static func createAttributedText(
        text: String,
        color: UIColor,
        kern: CGFloat) -> NSAttributedString {

        let attributedString = NSMutableAttributedString(string: text)
        attributedString.apply(foregroundColor: color)

        attributedString.apply(kernValue: kern)

        return attributedString
    }
}
