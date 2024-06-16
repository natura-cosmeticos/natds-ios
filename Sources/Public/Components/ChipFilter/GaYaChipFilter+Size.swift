//
//  GaYaChipFilter+Size.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 15/06/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

extension GaYaChipFilter {

    public enum Size: CaseIterable {
        case semi
        case semiX
        case medium

        var value: CGFloat {
            switch self {
            case .semi:
                return getTokenFromTheme(\.sizeSemi)
            case .semiX:
                return getTokenFromTheme(\.sizeSemiX)
            case .medium:
                return getTokenFromTheme(\.sizeMedium)
            }
        }
    }
}
