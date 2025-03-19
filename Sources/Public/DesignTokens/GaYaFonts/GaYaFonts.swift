//
//  GaYaFonts.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 17/03/25.
//  Copyright © 2025 Natura. All rights reserved.
//

import UIKit

public struct GaYaFonts {
    
    // MARK: - System Fonts
    
    public static func font(ofSize size: Size, withWeight weight: Weight) -> UIFont {
        UIFont.systemFont(ofSize: size.relatedTextStyle.size, weight: weight.rawValue)
    }

    public static func font(ofSize size: Size) -> UIFont {
        UIFont.systemFont(ofSize: size.relatedTextStyle.size, weight: size.relatedTextStyle.weight)
    }

    public static func font(ofSize size: CGFloat, withWeight weight: UIFont.Weight) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: weight)
    }

    public static func font(ofSize size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size)
    }

    // MARK: - Custom Fonts (Inclui tratamento para "San Francisco")

    public static func font(ofSize size: CGFloat,
                            withWeight weight: UIFont.Weight,
                            withFamily family: String) -> UIFont {
      
        if family.lowercased().contains("san francisco") {
            return UIFont.systemFont(ofSize: size, weight: weight)
        }

        return UIFont(name: family, size: size) ?? UIFont.systemFont(ofSize: size, weight: weight)
    }

    public static func customFont(ofSize fontSize: Size,
                                  withStyle customFont: CustomFontStyle) -> UIFont {
        return loadCustomFont(customFont, size: fontSize.relatedTextStyle.size)
    }

    public static func customFont(ofSize fontSize: CGFloat,
                                  withStyle customFont: CustomFontStyle) -> UIFont {
        return loadCustomFont(customFont, size: fontSize)
    }
    
    // MARK: - Helper para Fontes Customizadas
    
    private static func loadCustomFont(_ customFont: CustomFontStyle, size: CGFloat) -> UIFont {
        AssetsHelper.loadFont(customFont, type: .custom)

        return UIFont(name: customFont.name, size: size) ??
               UIFont.systemFont(ofSize: size, weight: customFont.weight)
    }
}

// MARK: - Size

extension GaYaFonts {
    public enum Size {
        case heading1, heading2, heading3, heading4, heading5, heading6
        case subtitle1, subtitle2
        case body1, body2
        @available(*, deprecated, message: "Button token is deprecated")
        case button
        case caption, overline

        var relatedTextStyle: TextStyle {
            switch self {
            case .heading1: return .heading1
            case .heading2: return .heading2
            case .heading3: return .heading3
            case .heading4: return .heading4
            case .heading5: return .heading5
            case .heading6: return .heading6
            case .subtitle1: return .subtitle1
            case .subtitle2: return .subtitle2
            case .body1: return .body1
            case .body2: return .body2
            case .button: return .button
            case .caption: return .caption
            case .overline: return .overline
            }
        }
    }
}

// MARK: - Weight

extension GaYaFonts {
    public enum Weight {
        case regular, medium, bold

        var rawValue: UIFont.Weight {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            case .bold: return .bold
            }
        }
    }
}

