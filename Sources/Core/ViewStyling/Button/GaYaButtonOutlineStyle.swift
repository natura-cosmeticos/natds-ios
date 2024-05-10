enum GaYaButtonOutlinedStyle {
    static func applyStyle(_ theme:AvailableTheme, _ color:GaYaButtonColor, on button: UIButton) {
        GaYaButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, color: color, on: button)
        button.layer.borderWidth = 1
    }

    static func applyStyleForStates(theme:AvailableTheme, color:GaYaButtonColor, on button: UIButton) {
        
        if theme == .none {
            
            switch color {
                
            case .colorDefault:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorPrimary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }
                
            case .primary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorPrimary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }
                            
            case .onPrimary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorOnPrimary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }
                            
            case .secondary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorSecondary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }
                            
            case .onSecondary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorOnSecondary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }
                            
            case .inverse:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorSurfaceFixedLight).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }
                            
            case .neutral:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = getUIColorFromTokens(\.colorSurfaceDark).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
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
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }
                
            case .primary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }
                            
            case .onPrimary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }
                            
            case .secondary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }
                            
            case .onSecondary:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }
                            
            case .inverse:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceFixedLight).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }
           
            case .neutral:
                switch button.state {
                case .normal:
                    button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDark).cgColor
                case .disabled:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                    button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground).cgColor
                default: break
                }

            }
        }
    }

    static func applyStyleForTitle(_ title: String, theme:AvailableTheme, color:GaYaButtonColor, on button: UIButton) {
        
        if theme == .none {
            
            switch color {
                
            case .colorDefault:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorContentHighEmphasis),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button)
                
            case .primary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorContentHighEmphasis),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button)
                            
            case .onPrimary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorOnPrimary),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button)
                            
            case .secondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorContentHighEmphasis),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button)
                            
            case .onSecondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorOnSecondary),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button)
                            
            case .inverse:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorContentHighlightFixedLight),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button)
                            
            case .neutral:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: getUIColorFromTokens(\.colorContentHighEmphasis),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button)
            }
        }
        else {
            
            switch color {
                
            case .colorDefault:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button)
                
            case .primary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button)
                            
            case .onPrimary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button)
                            
            case .secondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button)
                            
            case .onSecondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button)
                            
            case .inverse:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighlightFixedLight),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button)
                        
            case .neutral:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal: hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis),
                    colorForDisabled: hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button)
            }
        }
    }
}
