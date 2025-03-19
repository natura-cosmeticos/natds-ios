//
//  GaYaOpacity.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 23/08/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

public struct GaYaOpacity {
    
    // MARK: - Init
    
    private init() {}
    
    public static var transparent: CGFloat { getTokenFromTheme(\.opacityTransparent) }
    public static var lower: CGFloat { getTokenFromTheme(\.opacityLower) }
    public static var veryLow: CGFloat { getTokenFromTheme(\.opacityVeryLow) }
    public static var low: CGFloat { getTokenFromTheme(\.opacityLow) }
    public static var mediumLow: CGFloat { getTokenFromTheme(\.opacityMediumLow) }
    public static var disabledLow: CGFloat { getTokenFromTheme(\.opacityDisabledLow) }
    public static var disabled: CGFloat { getTokenFromTheme(\.opacityDisabled) }
    public static var medium: CGFloat { getTokenFromTheme(\.opacityMedium) }
    public static var mediumHigh: CGFloat { getTokenFromTheme(\.opacityMediumHigh) }
    public static var high: CGFloat { getTokenFromTheme(\.opacityHigh) }
    public static var veryHigh: CGFloat { getTokenFromTheme(\.opacityVeryHigh) }
    public static var opaque: CGFloat { getTokenFromTheme(\.opacityOpaque) }
    
}
