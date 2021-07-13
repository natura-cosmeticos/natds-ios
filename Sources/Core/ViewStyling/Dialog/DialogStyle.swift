enum DialogStyle {
    static func createLabelForTitle(title: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
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

    static func createDivider() -> Divider {
        let divider = Divider()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.configure(style: .fullBleed)
        return divider
    }

    static func createHeaderView(title: String) -> DialogHeaderView {
        let view = DialogHeaderView(title: title)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    static func createBodyView(body: String) -> DialogBodyView {
        let view = DialogBodyView(body: body)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
