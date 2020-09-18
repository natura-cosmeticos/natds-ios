enum ShortcutContainedStyle {
    static func applyPrimaryStyle(on shortcut: NatShortcut) {
        applyStyle(
            on: shortcut,
            circleColor: getUIColorFromTokens(\.colorPrimary),
            decorationColor: getUIColorFromTokens(\.colorOnPrimary)
        )
    }

    static func applyDefaultStyle(on shortcut: NatShortcut) {
        applyStyle(
            on: shortcut,
            circleColor: getUIColorFromTokens(\.colorSurface),
            decorationColor: getUIColorFromTokens(\.colorHighEmphasis)
        )
    }

    static private func applyStyle(on shortcut: NatShortcut, circleColor: UIColor, decorationColor: UIColor) {
        shortcut.configure(circleColor: circleColor)
        shortcut.configure(iconColor: decorationColor)

        let elevation = NatElevation.ElevationAttributes.elevation02
        ViewStyle.applyElevation(on: shortcut, with: elevation)
    }
}
