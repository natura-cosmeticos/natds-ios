import Foundation

public struct DSSpacing {
    private init() {}

    static var micro: CGFloat { getCurrentTheme().spacing.micro }
    static var tiny: CGFloat { getCurrentTheme().spacing.tiny }
    static var small: CGFloat { getCurrentTheme().spacing.small }
    static var standart: CGFloat { getCurrentTheme().spacing.standart }
    static var semi: CGFloat { getCurrentTheme().spacing.semi }
    static var large: CGFloat { getCurrentTheme().spacing.large }
    static var xLarge: CGFloat { getCurrentTheme().spacing.xLarge }
}
