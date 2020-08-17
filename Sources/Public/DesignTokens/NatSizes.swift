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
    public static var micro: CGFloat { getFromTheme(\.sizeMicro) }
    public static var tiny: CGFloat { getFromTheme(\.sizeTiny) }
    public static var small: CGFloat { getFromTheme(\.sizeSmall) }

    @available(*, deprecated, message: "Use standard instead")
    public static var standart: CGFloat { getFromTheme(\.sizeStandard) }
    public static var standard: CGFloat { getFromTheme(\.sizeStandard) }

    public static var semi: CGFloat { getFromTheme(\.sizeSemi) }
    public static var semiX: CGFloat { getFromTheme(\.sizeSemiX) }
    public static var medium: CGFloat { getFromTheme(\.sizeMedium) }
    public static var mediumX: CGFloat { getFromTheme(\.sizeMediumX) }
    public static var large: CGFloat { getFromTheme(\.sizeLarge) }
    public static var largeX: CGFloat { getFromTheme(\.sizeLargeX) }
    public static var largeXX: CGFloat { getFromTheme(\.sizeLargeXx) }
    public static var largeXXX: CGFloat { getFromTheme(\.sizeLargeXxx) }
    public static var huge: CGFloat { getFromTheme(\.sizeHuge) }
    public static var hugeX: CGFloat { getFromTheme(\.sizeHugeX) }
    public static var hugeXX: CGFloat { getFromTheme(\.sizeHugeXx) }
    public static var hugeXXX: CGFloat { getFromTheme(\.sizeHugeXxx) }
    public static var veryHuge: CGFloat { getFromTheme(\.sizeVeryHuge) }
}
