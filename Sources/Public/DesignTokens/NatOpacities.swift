/**
  NatOpacities is a enum that has access to alpha properties from the Design System.
  This properties are used to set alpha property from views.
  According with the current Brand in the Design System this properties can change.

    All properties returns a CGFloat.

    Exemple of usage:

        containerView.alpha = NatOpacity.opacity02
        profileView.alpha = NatOpacity.opacity03

 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public enum NatOpacities {
    public static var opacity01: CGFloat { getTheme().opacities.opacity01 }
    public static var opacity02: CGFloat { getTheme().opacities.opacity02 }
    public static var opacity03: CGFloat { getTheme().opacities.opacity03 }
    public static var opacity04: CGFloat { getTheme().opacities.opacity04 }
    public static var opacity05: CGFloat { getTheme().opacities.opacity05 }
    public static var opacity06: CGFloat { getTheme().opacities.opacity06 }
    public static var opacity07: CGFloat { getTheme().opacities.opacity07 }
    public static var opacity08: CGFloat { getTheme().opacities.opacity08 }
    public static var opacity09: CGFloat { getTheme().opacities.opacity09 }
    public static var opacity10: CGFloat { getTheme().opacities.opacity10 }
}
