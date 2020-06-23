enum DialogStyle {
    static func createLabelForTitle(title: String) -> UILabel {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .heading6, withWeight: .medium)
        label.attributedText = createTextForTitle(text: title, withColor: getTheme().colors.highEmphasis)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }

    static func createLabelForBody(body: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = NatFonts.font(ofSize: .body1, withWeight: .regular)
        label.attributedText = createTextForBody(text: body, withColor: getTheme().colors.highEmphasis)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }

    private static func createTextForTitle(text: String, withColor color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.apply(foregroundColor: color)

        let value = getTheme().font.letterSpacings.heading6
        attributedString.apply(kernValue: value)

        return attributedString
    }

    private static func createTextForBody(text: String, withColor color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.apply(foregroundColor: color)

        let value = getTheme().font.letterSpacings.body1
        attributedString.apply(kernValue: value)

        return attributedString
    }
}
