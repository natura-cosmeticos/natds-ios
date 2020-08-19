enum ShortcutOutlinedStyle {
    static func applyPrimaryStyle(on shortcut: NatShortcut) {
        applyStyle(on: shortcut, decorationColor: getTheme().colors.primary)
    }

    static func applyDefaultStyle(on shortcut: NatShortcut) {
        applyStyle(on: shortcut, decorationColor: getTheme().colors.highEmphasis)
    }

    static private func applyStyle(on shortcut: NatShortcut, decorationColor: UIColor) {
        shortcut.configure(circleColor: getTheme().colors.surface)
        let opacity = getTokenFromTheme(\.opacity04)
        shortcut.configure(circleBorderColor: decorationColor.withAlphaComponent(opacity).cgColor)
        shortcut.configure(circleBorderWidth: 1)
        shortcut.configure(iconColor: decorationColor)
    }
}
