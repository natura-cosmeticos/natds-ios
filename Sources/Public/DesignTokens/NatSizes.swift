/**
  NatSizes is a enum that has access to size properties from the Design System.
  This properties are used with constraints to handle view size of view objects.
  According with the current Brand in the Design System this properties can change.

    All properties returns a CGFloat.

    Exemple of usage:

        containerView.widthAnchor.constraint(equalToConstant: NatSizes.large)
        containerView.heightAncor.constraint(equalToConstant: NatSizes.tiny)

 - Requires:
        It's necessary to configure the Design System current Brand at DesignSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public enum NatSizes {
    public static var micro: CGFloat { getFromThemeTokens(\.sizeMicro) }
    public static var tiny: CGFloat { getFromThemeTokens(\.sizeTiny) }
    public static var small: CGFloat { getFromThemeTokens(\.sizeSmall) }

    @available(*, deprecated, message: "Use standard instead")
    public static var standart: CGFloat { getFromThemeTokens(\.sizeStandard) }
    public static var standard: CGFloat { getFromThemeTokens(\.sizeStandard) }

    public static var semi: CGFloat { getFromThemeTokens(\.sizeSemi) }
    public static var semiX: CGFloat { getFromThemeTokens(\.sizeSemiX) }
    public static var medium: CGFloat { getFromThemeTokens(\.sizeMedium) }
    public static var mediumX: CGFloat { getFromThemeTokens(\.sizeMediumX) }
    public static var large: CGFloat { getFromThemeTokens(\.sizeLarge) }
    public static var largeX: CGFloat { getFromThemeTokens(\.sizeLargeX) }
    public static var largeXX: CGFloat { getFromThemeTokens(\.sizeLargeXx) }
    public static var largeXXX: CGFloat { getFromThemeTokens(\.sizeLargeXxx) }
    public static var huge: CGFloat { getFromThemeTokens(\.sizeHuge) }
    public static var hugeX: CGFloat { getFromThemeTokens(\.sizeHugeX) }
    public static var hugeXX: CGFloat { getFromThemeTokens(\.sizeHugeXx) }
    public static var hugeXXX: CGFloat { getFromThemeTokens(\.sizeHugeXxx) }
    public static var veryHuge: CGFloat { getFromThemeTokens(\.sizeVeryHuge) }
}
