enum GaYaButtonStyle {
    static func applyStyle(on button: UIButton) {
        let size = getComponentAttributeFromTheme(\.buttonLabelFontSize)
        let weight = getComponentAttributeFromTheme(\.buttonLabelPrimaryFontWeight)
        let family = getComponentAttributeFromTheme(\.buttonLabelPrimaryFontFamily)
        button.titleLabel?.font = GaYaFonts.font(ofSize: size, withWeight: weight, withFamily: family)
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        button.contentEdgeInsets = GaYaButton.EdgeInsets.medium
    }

    static func applyStyleForTitle(_ title: String,
                                   colorForNormal: UIColor,
                                   colorForDisabled: UIColor,
                                   on button: UIButton) {

        let titleForNormal = createTextForTitle(text: title,
                                                withColor: colorForNormal)
        let titleForDisabled = createTextForTitle(text: title,
                                                  withColor: colorForDisabled)

        button.setAttributedTitle(titleForNormal, for: .normal)
        button.setAttributedTitle(titleForDisabled, for: .disabled)
    }

    static private func createTextForTitle(text: String, withColor color: UIColor) -> NSAttributedString {
        var attributedString = NSMutableAttributedString(string: text)

        let buttonTextStyle = getComponentAttributeFromTheme(\.buttonTextTransform)

        if buttonTextStyle == "lowercased" {
            attributedString = NSMutableAttributedString(string: text.lowercased())
        } else if buttonTextStyle == "capitalized" {
            attributedString = NSMutableAttributedString(string: text.capitalized)
        } else if buttonTextStyle == "uppercased" {
            attributedString = NSMutableAttributedString(string: text.uppercased())
        }

        attributedString.apply(foregroundColor: color)

        let value = getComponentAttributeFromTheme(\.buttonLabelLetterSpacing)
        attributedString.apply(kernValue: value)

        return attributedString
    }

}
