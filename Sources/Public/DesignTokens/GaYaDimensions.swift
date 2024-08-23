//
//  GaYaDimensions.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 23/08/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

public struct GaYaDimensions {
    
    // MARK: - Init
    
    private init() {}
    
    public static var spacingNone: CGFloat { getTokenFromTheme(\.spacingNone) }
    public static var spacingMicro: CGFloat { getTokenFromTheme(\.spacingMicro) }
    public static var spacingTiny: CGFloat { getTokenFromTheme(\.spacingTiny) }
    public static var spacingSmall: CGFloat { getTokenFromTheme(\.spacingSmall) }
    public static var spacingStandard: CGFloat { getTokenFromTheme(\.spacingStandard) }
    public static var spacingSemi: CGFloat { getTokenFromTheme(\.spacingSemi) }
    public static var spacingLarge: CGFloat { getTokenFromTheme(\.spacingLarge) }
    public static var spacingXLarge: CGFloat { getTokenFromTheme(\.spacingXLarge) }
    
}
