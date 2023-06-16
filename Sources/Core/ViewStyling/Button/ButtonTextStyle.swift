enum ButtonTextStyle {
    static func applyStyle(_ theme:AvailableTheme, on button: UIButton) {
        ButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, on: button)
    }

    static func applyStyleForStates(theme:AvailableTheme, on button: UIButton) {
        
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

    static func applyStyleForTitle(_ title: String, theme:AvailableTheme, on button: UIButton) {
        
        if theme == .none {
            ButtonStyle.applyStyleForTitle(
                title,
                colorForNormal: getUIColorFromComponentAttributes(\.buttonTextColorEnableLabel),
                colorForDisabled: getUIColorFromComponentAttributes(\.buttonTextColorDisableLabel),
                on: button
            )
        }
        else {
            ButtonStyle.applyStyleForTitle(
                title,
                colorForNormal: hexStringToUIColor(hex: theme.newInstance.components.buttonTextColorEnableLabel),
                colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonTextColorDisableLabel),
                on: button
            )
        }
    }
}
