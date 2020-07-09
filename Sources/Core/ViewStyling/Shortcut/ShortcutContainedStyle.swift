enum ShortcutContainedStyle {
    static func applyPrimaryStyle(on shortcut: NatShortcut) {
        applyStyle(
            on: shortcut,
            circleColor: getTheme().colors.primary,
            decorationColor: getTheme().colors.onPrimary
        )
    }

    static func applyDefaultStyle(on shortcut: NatShortcut) {
        applyStyle(
            on: shortcut,
            circleColor: getTheme().colors.surface,
            decorationColor: getTheme().colors.highEmphasis
        )
    }

    static private func applyStyle(on shortcut: NatShortcut, circleColor: UIColor, decorationColor: UIColor) {
        shortcut.configure(circleColor: circleColor)
        shortcut.configure(iconColor: decorationColor)

        let elevation = getTheme().elevations.elevation02
        ViewStyle.applyElevation(on: shortcut, with: elevation)
    }
}
