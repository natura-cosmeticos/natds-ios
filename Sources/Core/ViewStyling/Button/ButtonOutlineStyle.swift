enum ButtonOutlinedStyle {
    static func applyStyle(_ theme:AvailableTheme, on button: UIButton) {
        ButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, on: button)
        button.layer.borderWidth = 1
    }

    static func applyStyleForStates(theme:AvailableTheme, on button: UIButton) {
        
        if theme == .none {
            switch button.state {
            case .normal:
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBorder).cgColor
            case .disabled:
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
            default: break
            }
        }
        else {
            switch button.state {
            case .normal:
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonOutlinedColorEnableBorder).cgColor
            case .disabled:
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
            default: break
            }
        }
    }

    static func applyStyleForTitle(_ title: String, theme:AvailableTheme, on button: UIButton) {
        
        if theme == .none {
            ButtonStyle.applyStyleForTitle(
                title,
                colorForNormal: getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableLabel),
                colorForDisabled: getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableLabel),
                on: button
            )
        }
        else {
            ButtonStyle.applyStyleForTitle(
                title,
                colorForNormal: hexStringToUIColor(hex: theme.newInstance.components.buttonOutlinedColorEnableLabel),
                colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonOutlinedColorDisableLabel),
                on: button
            )
        }
    }
}
