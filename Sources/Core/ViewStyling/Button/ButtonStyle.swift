enum ButtonStyle {
    static func applyStyle(on button: UIButton) {
        button.titleLabel?.font = NatFonts.font(ofSize: .button, withWeight: .medium)
        button.titleLabel?.lineBreakMode = .byTruncatingTail

        button.layer.cornerRadius = NatBorderRadius.medium

        button.contentEdgeInsets = NatButton.EdgeInsets.medium
    }

    static func applyStyleForTitle(
        _ title: String,
        colorForNormal: UIColor,
        on button: UIButton) {

        let titleForNormal = createTextForTitle(
            text: title,
            withColor: colorForNormal
        )
        let titleForDisabled = createTextForTitle(
            text: title,
            withColor: NatColors.onSurface.withAlphaComponent(getTheme().opacities.opacity08)
        )

        button.setAttributedTitle(titleForNormal, for: .normal)
        button.setAttributedTitle(titleForDisabled, for: .disabled)
    }

    static private func createTextForTitle(text: String, withColor color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text.uppercased())
        attributedString.apply(foregroundColor: color)

        let value = getTheme().font.letterSpacings.button
        attributedString.apply(kernValue: value)

        return attributedString
    }
}
