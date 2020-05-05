/**
  DSSize is a enum that has access to size properties from the Design System.
  This properties are used with contraints to handle view size of view objects.
  According with the current Brand in the Design System this properties can change.

    All properties returns a CGFloat.

    Exemple of usage:

        containerView.widthAnchor.constraint(equalToConstant: DSSize.large)
        containerView.heightAncor.constraint(equalToConstant: DSSize.tiny)

 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public enum DSSize {
    public static var micro: CGFloat { getTheme().size.micro }
    public static var tiny: CGFloat { getTheme().size.tiny }
    public static var small: CGFloat { getTheme().size.small }
    public static var standart: CGFloat { getTheme().size.standart }
    public static var semi: CGFloat { getTheme().size.semi }
    public static var semiX: CGFloat { getTheme().size.semiX }
    public static var medium: CGFloat { getTheme().size.medium }
    public static var mediumX: CGFloat { getTheme().size.mediumX }
    public static var large: CGFloat { getTheme().size.large }
    public static var largeX: CGFloat { getTheme().size.largeX }
    public static var largeXX: CGFloat { getTheme().size.largeXX }
    public static var largeXXX: CGFloat { getTheme().size.largeXXX }
    public static var huge: CGFloat { getTheme().size.huge }
    public static var hugeX: CGFloat { getTheme().size.hugeX }
    public static var hugeXX: CGFloat { getTheme().size.hugeXX }
    public static var hugeXXX: CGFloat { getTheme().size.hugeXXX }
    public static var veryHuge: CGFloat { getTheme().size.veryHuge }
}
