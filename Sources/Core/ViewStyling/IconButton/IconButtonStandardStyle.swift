enum IconButtonStandardStyle {
    static func applyDefaultStyle(iconButton: NatIconButton) {
        applyStyle(iconButton: iconButton, withColor: getUIColorFromTokens(\.colorHighEmphasis))
    }

    static func applyPrimaryStyle(iconButton: NatIconButton) {
        applyStyle(iconButton: iconButton, withColor: getUIColorFromTokens(\.colorPrimary))
    }

    private static func applyStyle(iconButton: NatIconButton, withColor color: UIColor) {
        switch iconButton.currentState {
        case .eneable:
            iconButton.configure(iconColor: color)
        case .disabled:
            iconButton.configure(iconColor: getUIColorFromTokens(\.colorMediumEmphasis))
        }
    }
}
