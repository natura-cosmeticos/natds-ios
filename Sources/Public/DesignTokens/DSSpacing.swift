/**
  DSSpacing is a struct that has access to spacing properties from the Design System.
  This properties are used with contraints to handle view spaces between other views or view properties like
  safeAreaLayoutGuide.
  According with the current Brand in the Design System this spacing properties can change.

    All properties returns a CGFloat.

    Exemple of usage:

        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: DSSpacing.tiny)
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: DSSpacing.large)

 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public struct DSSpacing {
    private init() {}

    public static var micro: CGFloat { getCurrentTheme().spacing.micro }
    public static var tiny: CGFloat { getCurrentTheme().spacing.tiny }
    public static var small: CGFloat { getCurrentTheme().spacing.small }
    public static var standart: CGFloat { getCurrentTheme().spacing.standart }
    public static var semi: CGFloat { getCurrentTheme().spacing.semi }
    public static var large: CGFloat { getCurrentTheme().spacing.large }
    public static var xLarge: CGFloat { getCurrentTheme().spacing.xLarge }
}
