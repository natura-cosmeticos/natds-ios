enum IconButtonStandardStyle {
    static func applyDefaultStyle(iconButton: NatIconButton) {
        applyStyle(iconButton: iconButton,
                   withColor: getUIColorFromTokens(\.colorHighEmphasis))
    }

    static func applyPrimaryStyle(iconButton: NatIconButton) {
        applyStyle(iconButton: iconButton,
                   withColor: getUIColorFromTokens(\.colorPrimary))
    }

    static func applyLightStyle(iconButton: NatIconButton) {
        applyStyle(iconButton: iconButton,
                   withColor: getUIColorFromTokens(\.colorSurface))
    }

    private static func applyStyle(iconButton: NatIconButton,
                                   withColor color: UIColor) {
        switch iconButton.currentState {
        case .enabled:
            iconButton.configure(iconColor: color)
        case .disabled:
            iconButton.configure(iconColor: iconButton.backgroundStyle.disabledIconColor)
        }
    }
}
