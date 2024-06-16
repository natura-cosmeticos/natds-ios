//
//  GaYaAvatar+Size.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 15/06/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

extension GaYaAvatar {

    public enum Size: CaseIterable {
        case standard
        case semi
        case semiX
        case medium
        case largeXXX
    }
}

extension GaYaAvatar.Size {
    var value: CGFloat {
        switch self {
        case .standard:
            return getTokenFromTheme(\.sizeStandard)
        case .semi:
            return getTokenFromTheme(\.sizeSemi)
        case .semiX:
            return getTokenFromTheme(\.sizeSemiX)
        case .medium:
            return getTokenFromTheme(\.sizeMedium)
        case .largeXXX:
            return getTokenFromTheme(\.sizeLargeXXX)
        }
    }

    var font: UIFont {
        let fontWeight = getComponentAttributeFromTheme(\.avatarPrimaryFontWeight)
        let fontFamily = getComponentAttributeFromTheme(\.avatarPrimaryFontFamily)

        switch self {
        case .standard:
            return NatFonts.font(ofSize: getComponentAttributeFromTheme(\.avatarStandardFontSize),
                                 withWeight: fontWeight,
                                 withFamily: fontFamily)
        case .semi:
            return NatFonts.font(ofSize: getComponentAttributeFromTheme(\.avatarSemiFontSize),
                                 withWeight: fontWeight,
                                 withFamily: fontFamily)
        case .semiX:
            return NatFonts.font(ofSize: getComponentAttributeFromTheme(\.avatarSemiXFontSize),
                                 withWeight: fontWeight,
                                 withFamily: fontFamily)
        case .medium:
            return NatFonts.font(ofSize: getComponentAttributeFromTheme(\.avatarMediumFontSize),
                                 withWeight: fontWeight,
                                 withFamily: fontFamily)
        case .largeXXX:
            return NatFonts.font(ofSize: getComponentAttributeFromTheme(\.avatarLargeXXXFontSize),
                                 withWeight: fontWeight,
                                 withFamily: fontFamily)
        }
    }

    var letterSpacing: CGFloat {
        switch self {
        case .standard:
            return getComponentAttributeFromTheme(\.avatarStandardLetterSpacing)
        case .semi:
            return getComponentAttributeFromTheme(\.avatarSemiLetterSpacing)
        case .semiX:
            return getComponentAttributeFromTheme(\.avatarSemiXLetterSpacing)
        case .medium:
            return getComponentAttributeFromTheme(\.avatarMediumLetterSpacing)
        case .largeXXX:
            return getComponentAttributeFromTheme(\.avatarLargeXXXLetterSpacing)
        }
    }

    var lineHeight: CGFloat {
        switch self {
        case .standard:
            return getComponentAttributeFromTheme(\.avatarStandardLineHeight)
        case .semi:
            return getComponentAttributeFromTheme(\.avatarSemiLineHeight)
        case .semiX:
            return getComponentAttributeFromTheme(\.avatarSemiXLineHeight)
        case .medium:
            return getComponentAttributeFromTheme(\.avatarMediumLineHeight)
        case .largeXXX:
            return getComponentAttributeFromTheme(\.avatarLargeXXXLineHeight)
        }
    }
}
