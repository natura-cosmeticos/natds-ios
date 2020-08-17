/**
  NatSpacing is a enum that has access to spacing properties from the Design System.
  This properties are used with constraints to handle view spaces between other views or view
  properties like safeAreaLayoutGuide.
  According with the current Brand in the Design System this spacing properties can change.

    All properties returns a CGFloat.

    Exemple of usage:

        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: NatSpacing.tiny)
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: NatSpacing.large)

 - Requires:
        It's necessary to configure the Design System current Brand at DesignSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public enum NatSpacing {
    public static var micro: CGFloat { getFromTheme(\.spacingMicro) }
    public static var tiny: CGFloat { getFromTheme(\.spacingTiny) }
    public static var small: CGFloat { getFromTheme(\.spacingSmall) }
    @available(*, deprecated, message: "Use .standard instead")
    public static var standart: CGFloat { getFromTheme(\.spacingStandard) }
    public static var standard: CGFloat { getFromTheme(\.spacingStandard) }
    public static var semi: CGFloat { getFromTheme(\.spacingSemi) }
    public static var large: CGFloat { getFromTheme(\.spacingLarge) }
    public static var xLarge: CGFloat { getFromTheme(\.spacingXLarge) }
}
