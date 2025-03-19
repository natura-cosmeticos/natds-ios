//
//  GaYaIconButtonGhostStyle.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 13/12/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

enum GaYaIconButtonGhostStyle {
    static func applyStyle(_ theme:AvailableTheme, _ color:GaYaIconButtonColor, on button: UIButton) {
        GaYaIconButtonStyle.applyStyle(on: button)
        applyStyleForStates(theme: theme, color: color, on: button)
        applyStyleForIcon(theme: theme, color: color, on: button)
    }
    
    static func applyStyleForStates(theme:AvailableTheme, color:GaYaIconButtonColor, on button: UIButton) {
        
        if theme == .none {
            switch button.state {
            case .normal:
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonTextColorEnableBackground)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonTextColorEnableBackground).cgColor
            case .disabled:
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonTextColorEnableBackground)
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
                button.backgroundColor = getUIColorFromComponentAttributes(\.buttonTextColorEnableBackground)
                button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonTextColorDisableBorder).cgColor
            default: break
            }
        }
    }
    
    static func applyStyleForIcon(theme: AvailableTheme, color: GaYaIconButtonColor, on button: UIButton) {
        
        let colorForNormal: UIColor
        let colorForDisabled: UIColor
        
        if theme == .none {
            switch color {
            case .primary:
                colorForNormal = getUIColorFromTokens(\.colorPrimary)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            case .onPrimary:
                colorForNormal = getUIColorFromTokens(\.colorOnPrimary)
                colorForDisabled = getUIColorFromTokens(\.colorOnSurfaceDisabled)
            case .secondary:
                colorForNormal = getUIColorFromTokens(\.colorSecondary)
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
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            case .onPrimary:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary)
                colorForDisabled = hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDisabled)
            case .secondary:
                colorForNormal = hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary)
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
