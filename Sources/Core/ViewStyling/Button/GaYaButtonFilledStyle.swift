enum GaYaButtonFilledStyle {
    static func applyStyle(_ theme:AvailableTheme, _ color:GaYaButtonColor, on button: UIButton) {
        GaYaButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, color: color, on: button)
    }

    static func applyStyleForStates(theme:AvailableTheme, color:GaYaButtonColor, on button: UIButton) {
        
        if theme == .none {
            
            switch button.state {
            case .normal:
                
                switch color {
                case .colorDefault:
                    button.backgroundColor = getUIColorFromTokens(\.colorPrimary)
                case .primary:
                    button.backgroundColor = getUIColorFromTokens(\.colorPrimary)
                case .onPrimary:
                    button.backgroundColor = getUIColorFromTokens(\.colorNeutral0)
                case .secondary:
                    button.backgroundColor = getUIColorFromTokens(\.colorSecondary)
                case .onSecondary:
                    button.backgroundColor = getUIColorFromTokens(\.colorNeutral0)
                case .inverse:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceFixedLight)
                case .neutral:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDark)
                }
    
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonContainedColorEnableBorder).cgColor
                NatElevation.apply(on: button, elevation: .none)
            case .disabled:
                button.backgroundColor = getUIColorFromTokens(\.colorSurfaceDisabled)
                button.layer.borderColor = getUIColorFromTokens(\.colorSurfaceDisabled).cgColor
                NatElevation.apply(on: button, elevation: .none)
            default: break
            }
        }
        else {
            
            switch color {
            case .colorDefault:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                    
                    NatElevation.apply(on: button, elevation: .none)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled).cgColor
                    NatElevation.apply(on: button, elevation: .none)
                default: break
                }
            case .primary:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                    
                    NatElevation.apply(on: button, elevation: .none)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled).cgColor
                    NatElevation.apply(on: button, elevation: .none)
                default: break
                }
            case .onPrimary:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorNeutral0)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                    
                    NatElevation.apply(on: button, elevation: .none)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled).cgColor
                    NatElevation.apply(on: button, elevation: .none)
                default: break
                }
            case .secondary:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                    
                    NatElevation.apply(on: button, elevation: .none)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled).cgColor
                    NatElevation.apply(on: button, elevation: .none)
                default: break
                }
            case .onSecondary:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorNeutral0)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                    
                    NatElevation.apply(on: button, elevation: .none)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled).cgColor
                    NatElevation.apply(on: button, elevation: .none)
                default: break
                }
            case .inverse:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceFixedLight)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                    
                    NatElevation.apply(on: button, elevation: .none)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled).cgColor
                    NatElevation.apply(on: button, elevation: .none)
                default: break
                }
            case .neutral:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDark)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDark).cgColor
                    
                    NatElevation.apply(on: button, elevation: .none)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDisabled).cgColor
                    NatElevation.apply(on: button, elevation: .none)
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
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnPrimary),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .primary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnPrimary),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .onPrimary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorNeutral900),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .secondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnSecondary),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .onSecondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorNeutral900),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .inverse:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnSurfaceFixedLight),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .neutral:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnSurfaceDark),
                    colorForDisabled: getUIColorFromTokens(\.colorSurfaceDark),
                    on: button
                )
            }
        }
        else {
            
            switch color {
            case .colorDefault:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .primary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .onPrimary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorNeutral900),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .secondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .onSecondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorNeutral900),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .inverse:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceFixedLight),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .neutral:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDark),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            }
        }
    }
}
