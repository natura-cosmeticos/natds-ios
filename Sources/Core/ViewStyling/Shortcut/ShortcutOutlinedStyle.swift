enum ShortcutOutlinedStyle {
    static func applyPrimaryStyle(on shortcut: NatShortcut) {
        applyStyle(on: shortcut, decorationColor: getUIColorFromTokens(\.colorPrimary))
    }

    static func applyDefaultStyle(on shortcut: NatShortcut) {
        applyStyle(on: shortcut, decorationColor: getUIColorFromTokens(\.colorHighEmphasis))
    }

    static private func applyStyle(on shortcut: NatShortcut, decorationColor: UIColor) {
        shortcut.configure(circleColor: getUIColorFromTokens(\.colorSurface))
        let opacity = getTokenFromTheme(\.opacityMediumLow)
        shortcut.configure(circleBorderColor: decorationColor.withAlphaComponent(opacity).cgColor)
        shortcut.configure(circleBorderWidth: 1)
        shortcut.configure(iconColor: decorationColor)
    }
}
