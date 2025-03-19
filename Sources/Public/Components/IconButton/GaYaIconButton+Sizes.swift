//
//  GaYaIconButton+Sizes.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 26/11/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

extension GaYaIconButton {
    
    public enum Sizes {
        case semi
        case semix
        case medium
        
        var value: CGFloat {
            switch self {
            case .semi: return getTokenFromTheme(\.sizeSemi)
            case .semix: return getTokenFromTheme(\.sizeSemiX)
            case .medium: return getTokenFromTheme(\.sizeMedium)
            }
        }
        
        var fontSize: CGFloat {
            switch self {
            case .semi: return getTokenFromTheme(\.sizeStandard)
            case .semix: return getTokenFromTheme(\.sizeSemi)
            case .medium: return getTokenFromTheme(\.sizeSemiX)
            }
        }
        
        var borderRadius: CGFloat {
            switch self {
            case .semi: return getComponentAttributeFromTheme(\.iconButtonSemiBorderRadius)
            case .semix: return getComponentAttributeFromTheme(\.iconButtonSemiXBorderRadius)
            case .medium: return getComponentAttributeFromTheme(\.iconButtonMediumBorderRadius)
            }
        }
    }
}
