enum IconButtonStandardStyle {
    static func applyDefaultStyle(iconButton: NatIconButton) {
        applyStyle(iconButton: iconButton,
                   withColor: getUIColorFromTokens(\.colorHighEmphasis),
                   background: iconButton.backgroundStyle)
    }

    static func applyPrimaryStyle(iconButton: NatIconButton) {
        applyStyle(iconButton: iconButton,
                   withColor: getUIColorFromTokens(\.colorPrimary),
                   background: iconButton.backgroundStyle)
    }

    static func applyLightStyle(iconButton: NatIconButton) {
        applyStyle(iconButton: iconButton,
                   withColor: getUIColorFromTokens(\.colorSurface),
                   background: iconButton.backgroundStyle)
    }

    private static func applyStyle(iconButton: NatIconButton,
                                   withColor color: UIColor,
                                   background: NatIconButton.Background) {
        switch iconButton.currentState {
        case .enabled:
            iconButton.configure(iconColor: color)
            iconButton.configure(backgroundColor: iconButton.backgroundStyle.enabledColor)
            iconButton.configure(backgroundElevation: iconButton.backgroundStyle.enabledElevation)
        case .disabled:
            iconButton.configure(iconColor: iconButton.backgroundStyle.disabledIconColor)
            iconButton.configure(backgroundColor: iconButton.backgroundStyle.disabledColor)
            iconButton.configure(backgroundElevation: iconButton.backgroundStyle.disabledElevation)
        }
    }
}
