/**
  DSSpacing is a enum that has access to spacing properties from the Design System.
  This properties are used with contraints to handle view spaces between other views or view
  properties like safeAreaLayoutGuide.
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

public enum DSSpacing {
    public static var micro: CGFloat { getTheme().spacing.micro }
    public static var tiny: CGFloat { getTheme().spacing.tiny }
    public static var small: CGFloat { getTheme().spacing.small }
    public static var standart: CGFloat { getTheme().spacing.standart }
    public static var semi: CGFloat { getTheme().spacing.semi }
    public static var large: CGFloat { getTheme().spacing.large }
    public static var xLarge: CGFloat { getTheme().spacing.xLarge }
}
