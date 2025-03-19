//
//  GaYaSizes.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 23/08/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

public struct GaYaSizes {
    
    // MARK: - Init
    
    private init() {}
    
    public static var none: CGFloat { getTokenFromTheme(\.sizeNone) }
    public static var micro: CGFloat { getTokenFromTheme(\.sizeMicro) }
    public static var tiny: CGFloat { getTokenFromTheme(\.sizeTiny) }
    public static var small: CGFloat { getTokenFromTheme(\.sizeSmall) }
    public static var standard: CGFloat { getTokenFromTheme(\.sizeStandard) }
    public static var semi: CGFloat { getTokenFromTheme(\.sizeSemi) }
    public static var semiX: CGFloat { getTokenFromTheme(\.sizeSemiX) }
    public static var medium: CGFloat { getTokenFromTheme(\.sizeMedium) }
    public static var mediumX: CGFloat { getTokenFromTheme(\.sizeMediumX) }
    public static var large: CGFloat { getTokenFromTheme(\.sizeLarge) }
    public static var largeX: CGFloat { getTokenFromTheme(\.sizeLargeX) }
    public static var largeXX: CGFloat { getTokenFromTheme(\.sizeLargeXX) }
    public static var largeXXX: CGFloat { getTokenFromTheme(\.sizeLargeXXX) }
    public static var huge: CGFloat { getTokenFromTheme(\.sizeHuge) }
    public static var hugeX: CGFloat { getTokenFromTheme(\.sizeHugeX) }
    public static var hugeXX: CGFloat { getTokenFromTheme(\.sizeHugeXX) }
    public static var hugeXXX: CGFloat { getTokenFromTheme(\.sizeHugeXXX) }
    public static var veryHuge: CGFloat { getTokenFromTheme(\.sizeVeryHuge) }

    // Bordas (border radius)
    public static var borderRadiusNone: CGFloat { getTokenFromTheme(\.borderRadiusNone) }
    public static var borderRadiusSmall: CGFloat { getTokenFromTheme(\.borderRadiusSmall) }
    public static var borderRadiusMedium: CGFloat { getTokenFromTheme(\.borderRadiusMedium) }
    public static var borderRadiusLarge: CGFloat { getTokenFromTheme(\.borderRadiusLarge) }

    // Método para calcular o raio de borda para um círculo
    public static func radiusCircle(viewHeight: CGFloat) -> CGFloat {
        return viewHeight / 2
    }
}
