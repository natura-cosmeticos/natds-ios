enum ShortcutContainedStyle {
    static func applyPrimaryStyle(on shortcut: NatShortcut) {
        applyStyle(
            on: shortcut,
            backgroundColor: getTheme().colors.primary,
            decorationColor: getTheme().colors.highlight
        )
    }

    static func applyDefaultStyle(on shortcut: NatShortcut) {
        applyStyle(
            on: shortcut,
            backgroundColor: getTheme().colors.surface,
            decorationColor: getTheme().colors.highEmphasis
        )
    }

    static private func applyStyle(on shortcut: NatShortcut, backgroundColor: UIColor, decorationColor: UIColor) {
        shortcut.configure(circleColor: backgroundColor)
        shortcut.configure(iconColor: decorationColor)

        let elevation = getTheme().elevations.elevation04
        ViewStyle.applyElevation(on: shortcut, with: elevation)
    }
}
