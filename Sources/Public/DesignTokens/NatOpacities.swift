/**
  NatOpacities is a enum that has access to alpha properties from the Design System.
  This properties are used to set alpha property from views.
  According with the current Brand in the Design System this properties can change.

    All properties returns a CGFloat.

    Example of usage:

        containerView.alpha = NatOpacity.veryHigh
        profileView.alpha = NatOpacity.lower

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

@available(*, deprecated, message: "⚠️ GaYa DS: Por favor, use GaYaOpacity em vez disso.", renamed: "GaYaOpacity")
public enum NatOpacities {
    public static var transparent: CGFloat { getTokenFromTheme(\.opacityTransparent) }
    public static var lower: CGFloat { getTokenFromTheme(\.opacityLower) }
    public static var veryLow: CGFloat { getTokenFromTheme(\.opacityVeryLow) }
    public static var low: CGFloat { getTokenFromTheme(\.opacityLow) }
    public static var mediumLow: CGFloat { getTokenFromTheme(\.opacityMediumLow) }
    public static var disabledLow: CGFloat { getTokenFromTheme(\.opacityDisabledLow) }
    public static var disabled: CGFloat { getTokenFromTheme(\.opacityDisabled) }
    public static var medium: CGFloat { getTokenFromTheme(\.opacityMedium) }
    public static var mediumHigh: CGFloat { getTokenFromTheme(\.opacityMediumHigh) }
    public static var high: CGFloat { getTokenFromTheme(\.opacityHigh) }
    public static var veryHigh: CGFloat { getTokenFromTheme(\.opacityVeryHigh) }
    public static var opaque: CGFloat { getTokenFromTheme(\.opacityOpaque) }

    @available(*, deprecated, message: "use .lower instead")
    public static var opacity01: CGFloat { getTokenFromTheme(\.opacityLower) }
    @available(*, deprecated, message: "use .veryLow instead")
    public static var opacity02: CGFloat { getTokenFromTheme(\.opacityVeryLow) }
    @available(*, deprecated, message: "use .low instead")
    public static var opacity03: CGFloat { getTokenFromTheme(\.opacityLow) }
    @available(*, deprecated, message: "use .mediumLow instead")
    public static var opacity04: CGFloat { getTokenFromTheme(\.opacityMediumLow) }
    @available(*, deprecated, message: "use .disabledLow instead")
    public static var opacity05: CGFloat { getTokenFromTheme(\.opacityDisabledLow) }
    @available(*, deprecated, message: "use .disabled instead")
    public static var opacity06: CGFloat { getTokenFromTheme(\.opacityDisabled) }
    @available(*, deprecated, message: "use .medium instead")
    public static var opacity07: CGFloat { getTokenFromTheme(\.opacityMedium) }
    @available(*, deprecated, message: "use .mediumHigh instead")
    public static var opacity08: CGFloat { getTokenFromTheme(\.opacityMediumHigh) }
    @available(*, deprecated, message: "use .high instead")
    public static var opacity09: CGFloat { getTokenFromTheme(\.opacityHigh) }
    @available(*, deprecated, message: "use .veryHigh instead")
    public static var opacity10: CGFloat { getTokenFromTheme(\.opacityVeryHigh) }
    @available(*, deprecated, message: "use .opaque instead")
    public static var full: CGFloat { getTokenFromTheme(\.opacityOpaque) }
}
