//
//  NatFilter+Size.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 04/05/23.
//  Copyright © 2023 Natura. All rights reserved.
//

import Foundation

extension NatFilter {
    /**
     Size is an enum that represents the possible sizes for the NatChip size.
     The default size is `semi`.
     
     These are all sizes allowed for a NatChip:
     - semi
     - semiX
     - medium
     */
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
