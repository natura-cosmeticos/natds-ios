enum ButtonTextStyle {
    static func applyStyle(on button: UIButton) {
        ButtonStyle.applyStyle(on: button)
    }

    static func applyStyleForTitle(_ title: String?, on button: UIButton) {
        ButtonStyle.applyStyleForTitle(
            title,
            colorForNormal: getTheme().colors.highEmphasis,
            on: button
        )
    }
}
