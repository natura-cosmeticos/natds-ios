//
//  GaYaIconButtonOutlinedStyle.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 13/12/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

enum GaYaIconButtonOutlinedStyle {
    static func applyStyle(_ theme:AvailableTheme, _ color:GaYaIconButtonColor, on button: UIButton) {
        GaYaIconButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, color: color, on: button)
        applyStyleForIcon(theme: theme, color: color, on: button)
        button.layer.borderWidth = 1
    }
    
    static func applyStyleForStates(theme:AvailableTheme, color:GaYaIconButtonColor, on button: UIButton) {
        
        if theme == .none {
            
            switch color {
                
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
    
    static func applyStyleForIcon(theme: AvailableTheme, color: GaYaIconButtonColor, on button: UIButton) {
        
        // Definição de cores com base no tema e na cor escolhida
        let colorForNormal: UIColor
        let colorForDisabled: UIColor
        
        if theme == .none {
            switch color {
            case .primary:
                colorForNormal = getUIColorFromTokens(\.colorContentHighEmphasis)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            case .onPrimary:
                colorForNormal = getUIColorFromTokens(\.colorOnPrimary)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            case .secondary:
                colorForNormal = getUIColorFromTokens(\.colorContentHighEmphasis)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            case .onSecondary:
                colorForNormal = getUIColorFromTokens(\.colorOnSecondary)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            case .inverse:
                colorForNormal = getUIColorFromTokens(\.colorContentHighlightFixedLight)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            case .neutral:
                colorForNormal = getUIColorFromTokens(\.colorContentHighEmphasis)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            }
        } else {
            switch color {
            case .primary:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            case .onPrimary:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            case .secondary:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            case .onSecondary:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            case .inverse:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighlightFixedLight)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            case .neutral:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            }
        }
        
        button.tintColor = button.isEnabled ? colorForNormal : colorForDisabled
    }
    
}
