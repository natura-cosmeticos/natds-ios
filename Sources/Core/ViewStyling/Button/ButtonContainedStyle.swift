enum ButtonContainedStyle {
    static func applyStyle(_ theme:AvailableTheme, _ color:Color, on button: UIButton) {
        ButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, color: color, on: button)
    }

    static func applyStyleForStates(theme:AvailableTheme, color:Color, on button: UIButton) {
        
        if theme == .none {
            
            switch button.state {
            case .normal:
                
                switch color {
                case .colorDefault:
                    button.backgroundColor = getUIColorFromTokens(\.colorPrimary)
                case .primary:
                    button.backgroundColor = getUIColorFromTokens(\.colorPrimary)
                case .onPrimary:
                    button.backgroundColor = getUIColorFromTokens(\.colorOnPrimary)
                case .secondary:
                    button.backgroundColor = getUIColorFromTokens(\.colorSecondary)
                case .onSecondary:
                    button.backgroundColor = getUIColorFromTokens(\.colorOnSecondary)
                case .inverse:
                    button.backgroundColor = getUIColorFromTokens(\.colorSurfaceInverse)
                case .onInverse:
                    button.backgroundColor = getUIColorFromTokens(\.colorOnSurfaceInverse)
                }
    
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
            
            switch color {
            case .colorDefault:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                    
                    NatElevation.apply(on: button, elevation: .tiny)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBorder).cgColor
                    NatElevation.apply(on: button, elevation: .none)
                default: break
                }
            case .primary:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                    
                    NatElevation.apply(on: button, elevation: .tiny)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBorder).cgColor
                    NatElevation.apply(on: button, elevation: .none)
                default: break
                }
            case .onPrimary:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                    
                    NatElevation.apply(on: button, elevation: .tiny)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBorder).cgColor
                    NatElevation.apply(on: button, elevation: .none)
                default: break
                }
            case .secondary:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                    
                    NatElevation.apply(on: button, elevation: .tiny)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBorder).cgColor
                    NatElevation.apply(on: button, elevation: .none)
                default: break
                }
            case .onSecondary:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                    
                    NatElevation.apply(on: button, elevation: .tiny)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBorder).cgColor
                    NatElevation.apply(on: button, elevation: .none)
                default: break
                }
            case .inverse:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceInverse)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorEnableBorder).cgColor
                    
                    NatElevation.apply(on: button, elevation: .tiny)
                case .disabled:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBackground)
                    button.layer.borderColor = hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableBorder).cgColor
                    NatElevation.apply(on: button, elevation: .none)
                default: break
                }
            case .onInverse:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceInverse)
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
    }

    static func applyStyleForTitle(_ title: String, theme:AvailableTheme, color:Color, on button: UIButton) {
        
        if theme == .none {
            
            switch color {
            case .colorDefault:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnPrimary),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonContainedColorDisableLabel),
                    on: button
                )
            case .primary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnPrimary),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonContainedColorDisableLabel),
                    on: button
                )
            case .onPrimary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorPrimary),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonContainedColorDisableLabel),
                    on: button
                )
            case .secondary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnSecondary),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonContainedColorDisableLabel),
                    on: button
                )
            case .onSecondary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorSecondary),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonContainedColorDisableLabel),
                    on: button
                )
            case .inverse:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnSurfaceInverse),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonContainedColorDisableLabel),
                    on: button
                )
            case .onInverse:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorSurfaceInverse),
                    colorForDisabled: getUIColorFromComponentAttributes(\.buttonContainedColorDisableLabel),
                    on: button
                )
            }
        }
        else {
            
            switch color {
            case .colorDefault:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableLabel),
                    on: button
                )
            case .primary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableLabel),
                    on: button
                )
            case .onPrimary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableLabel),
                    on: button
                )
            case .secondary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableLabel),
                    on: button
                )
            case .onSecondary:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableLabel),
                    on: button
                )
            case .inverse:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceInverse),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableLabel),
                    on: button
                )
            case .onInverse:
                ButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceInverse),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.components.buttonContainedColorDisableLabel),
                    on: button
                )
            }
        }
    }
}
