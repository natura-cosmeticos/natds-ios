//
//  GaYaIconButtonTonalStyle.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 13/12/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

enum GaYaIconButtonTonalStyle {
    static func applyStyle(_ theme:AvailableTheme, _ color:GaYaIconButtonColor, on button: UIButton) {
        GaYaIconButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, color: color, on: button)
        applyStyleForIcon(theme: theme, color: color, on: button)
    }
    
    static func applyStyleForStates(theme:AvailableTheme, color:GaYaIconButtonColor, on button: UIButton) {
        
        if theme == .none {
            
            switch button.state {
            case .normal:
                
                switch color {
                case .primary:
                    button.backgroundColor = getUIColorFromTokens(\.colorPrimaryLightest)
                case .onPrimary:
                    button.backgroundColor = getUIColorFromTokens(\.colorPrimaryLight)
                case .secondary:
                    button.backgroundColor = getUIColorFromTokens(\.colorSecondaryLightest)
                case .onSecondary:
                    button.backgroundColor = getUIColorFromTokens(\.colorSecondaryLight)
                case .inverse:
                    button.backgroundColor = getUIColorFromTokens(\.colorNeutral600)
                case .neutral:
                    button.backgroundColor = getUIColorFromTokens(\.colorNeutral100)
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
            case .primary:
                switch button.state {
                case .normal:
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimaryLightest)
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
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimaryLight)
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
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondaryLightest)
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
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondaryLight)
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
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorNeutral600)
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
                    button.backgroundColor = hexStringToUIColor(hex: theme.newInstance.tokens.colorNeutral100)
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
    
    static func applyStyleForIcon(theme: AvailableTheme, color: GaYaIconButtonColor, on button: UIButton) {
        
        let colorForNormal: UIColor
        let colorForDisabled: UIColor
        
        if theme == .none {
            switch color {
            case .primary:
                colorForNormal = getUIColorFromTokens(\.colorOnPrimaryLightest)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            case .onPrimary:
                colorForNormal = getUIColorFromTokens(\.colorOnPrimaryLight)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            case .secondary:
                colorForNormal = getUIColorFromTokens(\.colorOnSecondaryLightest)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            case .onSecondary:
                colorForNormal = getUIColorFromTokens(\.colorOnSecondaryLight)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            case .inverse:
                colorForNormal = getUIColorFromTokens(\.colorNeutral0)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            case .neutral:
                colorForNormal = getUIColorFromTokens(\.colorContentHighEmphasis)
                colorForDisabled = getUIColorFromTokens(\.colorSurfaceDark)
            }
        } else {
            switch color {
            case .primary:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimaryLightest)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            case .onPrimary:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimaryLight)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            case .secondary:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondaryLightest)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            case .onSecondary:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondaryLight)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            case .inverse:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorNeutral0)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            case .neutral:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            }
        }
        
        button.tintColor = button.isEnabled ? colorForNormal : colorForDisabled
    }
    
}
