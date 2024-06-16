//
//  GaYaChipFilter+Color.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 15/06/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

extension GaYaChipFilter {
    
    public enum Color {
        case primary
        case onPrimary
        case secondary
        case onSecondary
        case neutral
        case inverse
    }
    
    public struct ThemeColor {
        private let theme: AvailableTheme
        private let colorType: Color


        public init(theme: AvailableTheme, colorType: Color) {
            self.theme = theme
            self.colorType = colorType
        }

        public var selectedColor: UIColor {
            switch colorType {
            case .primary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorPrimary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary)
                }
            case .onPrimary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorPrimaryDarkest)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimaryDarkest)
                }
            case .secondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSecondary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary)
                }
            case .onSecondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSecondaryDarkest)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondaryDarkest)
                }
            case .neutral:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSurfaceDark)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDark)
                }
            case .inverse:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSurfaceFixedLight)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceFixedLight)
                }
            }
        }
        
        public var selectedLabelColor: UIColor {
            switch colorType {
            case .primary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnPrimary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary)
                }
            case .onPrimary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnPrimaryDarkest)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimaryDarkest)
                }
            case .secondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnSecondary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary)
                }
            case .onSecondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnSecondaryDarkest)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondaryDarkest)
                }
            case .neutral:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnSurfaceDark)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceDark)
                }
            case .inverse:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnSurfaceFixedLight)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSurfaceFixedLight)
                }
            }
        }
        
        public var labelColor: UIColor {
            switch colorType {
            case .primary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorContentHighEmphasis)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis)
                }
            case .onPrimary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnPrimary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary)
                }
            case .secondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorContentHighEmphasis)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis)
                }
            case .onSecondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorContentHighEmphasis)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis)
                }
            case .neutral:
                if theme == .none {
                    return getUIColorFromTokens(\.colorContentHighEmphasis)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighEmphasis)
                }
            case .inverse:
                if theme == .none {
                    return getUIColorFromTokens(\.colorContentHighlightFixedLight)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorContentHighlightFixedLight)
                }
            }
        }
        
        public var borderColor: UIColor {
            switch colorType {
            case .primary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorPrimary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary)
                }
            case .onPrimary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnPrimary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary)
                }
            case .secondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSecondary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary)
                }
            case .onSecondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnSecondary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary)
                }
            case .neutral:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSurfaceDark)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceDark)
                }
            case .inverse:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSurfaceFixedLight)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSurfaceFixedLight)
                }
            }
        }
    }
}
