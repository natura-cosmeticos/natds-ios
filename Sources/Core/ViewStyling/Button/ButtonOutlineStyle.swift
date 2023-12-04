enum ButtonOutlinedStyle {
    static func applyStyle(_ theme:AvailableTheme, _ color:Color, on button: UIButton) {
        ButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, color: color, on: button)
        button.layer.borderWidth = 1
    }

    static func applyStyleForStates(theme:AvailableTheme, color:Color, on button: UIButton) {
        
        if theme == .none {
            
            switch color {
                
            case .colorDefault:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorPrimary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
                
            case .primary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorPrimary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
                            
            case .onPrimary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorOnPrimary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
                            
            case .secondary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorSecondary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
                            
            case .onSecondary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorOnSecondary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
                            
            case .inverse:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorSurfaceInverse).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
                            
            case .onInverse:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorOnSurfaceInverse).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
            }
        }
        else {
          
            switch color {
                
            case .colorDefault:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
                
            case .primary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
                            
            case .onPrimary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
                            
            case .secondary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
                            
            case .onSecondary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
                            
            case .inverse:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceInverse).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }
                            
            case .onInverse:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceInverse).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
                default: break
                }

            }
        }
    }

    static func applyStyleForTitle(_ title: String, theme:AvailableTheme, color:Color, on button: UIButton) {
        
        if theme == .none {
            
            switch color {
                
            case .colorDefault:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorHighEmphasis),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableLabel),
                    on: button)
                
            case .primary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorHighEmphasis),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableLabel),
                    on: button)
                            
            case .onPrimary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorOnPrimary),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableLabel),
                    on: button)
                            
            case .secondary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorHighEmphasis),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableLabel),
                    on: button)
                            
            case .onSecondary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorOnSecondary),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableLabel),
                    on: button)
                            
            case .inverse:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorSurfaceInverse),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableLabel),
                    on: button)
                            
            case .onInverse:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorOnSurfaceInverse),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableLabel),
                    on: button)
            }
        }
        else {
            
            switch color {
                
            case .colorDefault:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorHighEmphasis),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonOutlinedColorDisableLabel),
                    on: button)
                
            case .primary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorHighEmphasis),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonOutlinedColorDisableLabel),
                    on: button)
                            
            case .onPrimary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonOutlinedColorDisableLabel),
                    on: button)
                            
            case .secondary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorHighEmphasis),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonOutlinedColorDisableLabel),
                    on: button)
                            
            case .onSecondary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonOutlinedColorDisableLabel),
                    on: button)
                            
            case .inverse:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceInverse),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonOutlinedColorDisableLabel),
                    on: button)
                            
            case .onInverse:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceInverse),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.components.buttonOutlinedColorDisableLabel),
                    on: button)
            }
        }
    }
}
