//
//  GaYaTag+Size.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 12/11/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

extension GaYaTag {

    public enum Size: CaseIterable {
        case small
        case standard

        var value: CGFloat {
            switch self {
            case .small:
                return getTokenFromTheme(\.sizeSmall)
            case .standard:
                return getTokenFromTheme(\.sizeStandard)
            }
        }

        var iconSize: CGFloat {
            let iconPadding: CGFloat = 4
            switch self {
            case .small:
                return getTokenFromTheme(\.sizeSmall) - iconPadding
            case .standard:
                return getTokenFromTheme(\.sizeStandard) - iconPadding
            }
        }
    }
}
