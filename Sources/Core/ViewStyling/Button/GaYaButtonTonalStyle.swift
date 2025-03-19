//
//  GaYaButtonTonalStyle.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 25/04/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

enum GaYaButtonTonalStyle {
    static func applyStyle(_ theme:AvailableTheme, _ color:GaYaButtonColor, on button: UIButton) {
        GaYaButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, color: color, on: button)
    }

    static func applyStyleForStates(theme:AvailableTheme, color:GaYaButtonColor, on button: UIButton) {
        
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

    static func applyStyleForTitle(_ title: String, theme:AvailableTheme, color:GaYaButtonColor, on button: UIButton) {
        
        if theme == .none {
            
            switch color {
            case .primary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnPrimaryLightest),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .onPrimary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnPrimaryLight),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .secondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnSecondaryLightest),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .onSecondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorOnSecondaryLight),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .inverse:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorNeutral0),
                    colorForDisabled: getUIColorFromTokens(\.colorOnSurfaceDisabled),
                    on: button
                )
            case .neutral:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        getUIColorFromTokens(\.colorContentHighEmphasis),
                    colorForDisabled: getUIColorFromTokens(\.colorSurfaceDark),
                    on: button
                )
            }
        }
        else {
            
            switch color {
            case .primary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimaryLightest),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .onPrimary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimaryLight),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .secondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondaryLightest),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .onSecondary:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondaryLight),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .inverse:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorNeutral0),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            case .neutral:
                GaYaButtonStyle.applyStyleForTitle(
                    title,
                    colorForNormal:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis),
                    colorForDisabled:
                        hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled),
                    on: button
                )
            }
        }
    }
}
