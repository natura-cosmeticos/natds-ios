/**
  NatOpacities is a enum that has access to alpha properties from the Design System.
  This properties are used to set alpha property from views.
  According with the current Brand in the Design System this properties can change.

    All properties returns a CGFloat.

    Exemple of usage:

        containerView.alpha = NatOpacity.opacity02
        profileView.alpha = NatOpacity.opacity03

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public enum NatOpacities {
    public static var transparent: CGFloat { getTokenFromTheme(\.opacityTransparent) }
    public static var opacity01: CGFloat { getTokenFromTheme(\.opacityLower) }
    public static var opacity02: CGFloat { getTokenFromTheme(\.opacityVeryLow) }
    public static var opacity03: CGFloat { getTokenFromTheme(\.opacityLow) }
    public static var opacity04: CGFloat { getTokenFromTheme(\.opacityMediumLow) }
    public static var opacity05: CGFloat { getTokenFromTheme(\.opacityDisabledLow) }
    public static var opacity06: CGFloat { getTokenFromTheme(\.opacityDisabled) }
    public static var opacity07: CGFloat { getTokenFromTheme(\.opacityMedium) }
    public static var opacity08: CGFloat { getTokenFromTheme(\.opacityMediumHigh) }
    public static var opacity09: CGFloat { getTokenFromTheme(\.opacityHigh) }
    public static var opacity10: CGFloat { getTokenFromTheme(\.opacityVeryHigh) }
    public static var full: CGFloat { getTokenFromTheme(\.opacityOpaque) }
}
