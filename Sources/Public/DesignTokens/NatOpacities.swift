/**
  NatOpacities is a enum that has access to alpha properties from the Design System.
  This properties are used to set alpha property from views.
  According with the current Brand in the Design System this properties can change.

    All properties returns a CGFloat.

    Exemple of usage:

        containerView.alpha = NatOpacity.opacity02
        profileView.alpha = NatOpacity.opacity03

 - Requires:
        It's necessary to configure the Design System current Brand at DesignSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public enum NatOpacities {
    public static var transparent: CGFloat { getFromThemeTokens(\.opacityTransparent) }
    public static var opacity01: CGFloat { getFromThemeTokens(\.opacity01) }
    public static var opacity02: CGFloat { getFromThemeTokens(\.opacity02) }
    public static var opacity03: CGFloat { getFromThemeTokens(\.opacity03) }
    public static var opacity04: CGFloat { getFromThemeTokens(\.opacity04) }
    public static var opacity05: CGFloat { getFromThemeTokens(\.opacity05) }
    public static var opacity06: CGFloat { getFromThemeTokens(\.opacity06) }
    public static var opacity07: CGFloat { getFromThemeTokens(\.opacity07) }
    public static var opacity08: CGFloat { getFromThemeTokens(\.opacity08) }
    public static var opacity09: CGFloat { getFromThemeTokens(\.opacity09) }
    public static var opacity10: CGFloat { getFromThemeTokens(\.opacity10) }
    public static var full: CGFloat { getFromThemeTokens(\.opacityFull) }
}
