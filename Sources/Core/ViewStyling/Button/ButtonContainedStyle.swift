enum ButtonContainedStyle {
    static func applyStyle(_ theme:AvailableTheme, on button: UIButton) {
        ButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, on: button)
    }

    static func applyStyleForStates(theme:AvailableTheme, on button: UIButton) {
        
        if theme == .none {
            switch button.state {
            case .normal:
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonContainedColorEnableBackground)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonContainedColorEnableBorder).cgColor
                NatElevation.apply(on: button, elevation: .tiny)
            case .disabled:
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonContainedColorDisableBackground)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonContainedColorDisableBorder).cgColor
                NatElevation.apply(on: button, elevation: .none)
            default: break
            }
        }
        else {
            switch button.state {
            case .normal:
                button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBackground)
                button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                
                NatElevation.apply(on: button, elevation: .tiny)
            case .disabled:
                button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBackground)
                button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBorder).cgColor
                NatElevation.apply(on: button, elevation: .none)
            default: break
            }
        }
        
        
    }

    static func applyStyleForTitle(_ title: String, theme:AvailableTheme, on button: UIButton) {
        
        if theme == .none {
            ButtonStyle.applyStyleForTitle(
                title,
                colorForNormal:
                    getUIColorFromComponentAttributes(\.buttonContainedColorEnableLabel),
                colorForDisabled: getUIColorFromComponentAttributes(\.buttonContainedColorDisableLabel),
                on: button
            )
        }
        else {
            ButtonStyle.applyStyleForTitle(
                title,
                colorForNormal:
                    hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableLabel),
                colorForDisabled:
                    hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableLabel),
                on: button
            )
        }
        
        
    }
}
