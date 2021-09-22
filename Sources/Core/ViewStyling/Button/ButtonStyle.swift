enum ButtonStyle {
    static func applyStyle(on button: UIButton) {
        let size = getComponentAttributeFromTheme(\.buttonLabelFontSize)
        let weight = getComponentAttributeFromTheme(\.buttonLabelPrimaryFontWeight)
        let family = getComponentAttributeFromTheme(\.buttonLabelPrimaryFontFamily)
        button.titleLabel?.font = NatFonts.font(ofSize: size, withWeight: weight, withFamily: family)
        button.titleLabel?.lineBreakMode = .byTruncatingTail

        button.layer.cornerRadius = getComponentAttributeFromTheme(\.buttonBorderRadius)

        button.contentEdgeInsets = NatButton.EdgeInsets.medium
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
        let attributedString = NSMutableAttributedString(string: text.uppercased())
        attributedString.apply(foregroundColor: color)

        let value = getComponentAttributeFromTheme(\.buttonLabelLetterSpacing)
        attributedString.apply(kernValue: value)

        return attributedString
    }
}
