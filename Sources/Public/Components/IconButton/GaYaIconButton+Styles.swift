//
//  GaYaIconButton+Styles.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 26/11/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

extension GaYaIconButton {
    
    public struct Style {
        let applyStyle: (AvailableTheme, GaYaIconButtonColor, GaYaIconButton) -> Void
        let changeState: (AvailableTheme, GaYaIconButtonColor, GaYaIconButton) -> Void?
        let applyIconStyle: (AvailableTheme, GaYaIconButtonColor, GaYaIconButton) -> Void?
    }
}

extension GaYaIconButton.Style {
    public static var filled: GaYaIconButton.Style {
        .init(
            applyStyle: GaYaIconButtonFilledStyle.applyStyle,
            changeState: GaYaIconButtonFilledStyle.applyStyleForStates,
            applyIconStyle: GaYaIconButtonFilledStyle.applyStyleForIcon
        )
    }
    
    public static var outlined: GaYaIconButton.Style {
        .init(
            applyStyle: GaYaIconButtonOutlinedStyle.applyStyle,
            changeState: GaYaIconButtonOutlinedStyle.applyStyleForStates,
            applyIconStyle: GaYaIconButtonOutlinedStyle.applyStyleForIcon
        )
    }
    
    public static var ghost: GaYaIconButton.Style {
        .init(
            applyStyle: GaYaIconButtonGhostStyle.applyStyle,
            changeState: GaYaIconButtonGhostStyle.applyStyleForStates,
            applyIconStyle: GaYaIconButtonGhostStyle.applyStyleForIcon
        )
    }
    
    public static var tonal: GaYaIconButton.Style {
        .init(
            applyStyle: GaYaIconButtonTonalStyle.applyStyle,
            changeState: GaYaIconButtonTonalStyle.applyStyleForStates,
            applyIconStyle: GaYaIconButtonTonalStyle.applyStyleForIcon
        )
    }
}
