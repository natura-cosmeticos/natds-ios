/**
  NatSizes is a enum that has access to size properties from the Design System.
  This properties are used with constraints to handle view size of view objects.
  According with the current Brand in the Design System this properties can change.

    All properties returns a CGFloat.

    Example of usage:

        containerView.widthAnchor.constraint(equalToConstant: NatSizes.large)
        containerView.heightAncor.constraint(equalToConstant: NatSizes.tiny)

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public enum NatSizes {
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
}
