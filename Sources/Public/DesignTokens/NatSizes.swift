/**
  NatSizes is a enum that has access to size properties from the Design System.
  This properties are used with contraints to handle view size of view objects.
  According with the current Brand in the Design System this properties can change.

    All properties returns a CGFloat.

    Exemple of usage:

        containerView.widthAnchor.constraint(equalToConstant: NatSizes.large)
        containerView.heightAncor.constraint(equalToConstant: NatSizes.tiny)

 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public enum NatSizes {
    public static var micro: CGFloat { getTheme().sizes.micro }
    public static var tiny: CGFloat { getTheme().sizes.tiny }
    public static var small: CGFloat { getTheme().sizes.small }

    @available(*, deprecated, message: "Use standard instead")
    public static var standart: CGFloat { getTheme().sizes.standard }
    public static var standard: CGFloat { getTheme().sizes.standard }

    public static var semi: CGFloat { getTheme().sizes.semi }
    public static var semiX: CGFloat { getTheme().sizes.semix }
    public static var medium: CGFloat { getTheme().sizes.medium }
    public static var mediumX: CGFloat { getTheme().sizes.mediumx }
    public static var large: CGFloat { getTheme().sizes.large }
    public static var largeX: CGFloat { getTheme().sizes.largex }
    public static var largeXX: CGFloat { getTheme().sizes.largexx }
    public static var largeXXX: CGFloat { getTheme().sizes.largexxx }
    public static var huge: CGFloat { getTheme().sizes.huge }
    public static var hugeX: CGFloat { getTheme().sizes.hugex }
    public static var hugeXX: CGFloat { getTheme().sizes.hugexx }
    public static var hugeXXX: CGFloat { getTheme().sizes.hugexxx }
    public static var veryHuge: CGFloat { getTheme().sizes.veryhuge }
}
