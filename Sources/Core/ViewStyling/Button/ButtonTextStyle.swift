enum ButtonTextStyle {
    static func applyStyle(_ theme:AvailableTheme, _ color:Color, on button: UIButton) {
        ButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, color: color, on: button)
    }

    static func applyStyleForStates(theme:AvailableTheme, color:Color, on button: UIButton) {
        
        if theme == .none {
            switch button.state {
            case .normal:
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonTextColorEnableBackground)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonTextColorEnableBorder).cgColor
            case .disabled:
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonTextColorDisableBackground)
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
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonTextColorDisableBackground)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonTextColorDisableBorder).cgColor
            default: break
            }
        }
    }

    static func applyStyleForTitle(_ title: String, theme:AvailableTheme, color:Color, on button: UIButton) {
        
        if theme == .none {
            switch color {
            case .primary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorPrimary),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonTextColorDisableLabel),
                    on: button
                )
            case .onPrimary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorOnPrimary),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonTextColorDisableLabel),
                    on: button
                )
            case .secondary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorSecondary),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonTextColorDisableLabel),
                    on: button
                )
            case .onSecondary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorOnSecondary),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonTextColorDisableLabel),
                    on: button
                )
            case .inverse:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorSurfaceInverse),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonTextColorDisableLabel),
                    on: button
                )
            case .onInverse:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorOnSurfaceInverse),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonTextColorDisableLabel),
                    on: button
                )
            }
        }
        else {
            switch color {
            case .primary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonTextColorDisableLabel),
                    on: button
                )
            case .onPrimary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonTextColorDisableLabel),
                    on: button
                )
            case .secondary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonTextColorDisableLabel),
                    on: button
                )
            case .onSecondary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonTextColorDisableLabel),
                    on: button
                )
            case .inverse:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceInverse),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonTextColorDisableLabel),
                    on: button
                )
            case .onInverse:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceInverse),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonTextColorDisableLabel),
                    on: button
                )
            }
        }
    }
}
