enum GaYaButtonGhostStyle {
    static func applyStyle(_ theme:AvailableTheme, _ color:GaYaButtonColor, on button: UIButton) {
        GaYaButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, color: color, on: button)
    }

    static func applyStyleForStates(theme:AvailableTheme, color:GaYaButtonColor, on button: UIButton) {
        
        if theme == .none {
            switch button.state {
            case .normal:
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonTextColorEnableBackground)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonTextColorEnableBackground).cgColor
            case .disabled:
                button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonTextColorDisableBorder).cgColor
            default: break
            }
        }
        else {
            switch button.state {
            case .normal:
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonTextColorEnableBackground)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonTextColorEnableBorder).cgColor
            case .disabled:
                button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonTextColorDisableBorder).cgColor
            default: break
            }
        }
    }

    static func applyStyleForTitle(_ title: String, theme:AvailableTheme, color:GaYaButtonColor, on button: UIButton) {
        
        if theme == .none {
            switch color {
            case .colorDefault:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorHighEmphasis),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .primary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorPrimary),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .onPrimary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorOnPrimary),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .secondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorSecondary),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .onSecondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorOnSecondary),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .inverse:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorContentHighlightFixedLight),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .neutral:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorContentHighEmphasis),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            }
        }
        else {
            switch color {
            case .colorDefault:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorHighEmphasis),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .primary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .onPrimary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .secondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .onSecondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .inverse:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighlightFixedLight),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .neutral:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            }
        }
    }
}
