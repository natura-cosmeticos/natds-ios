/**
  NatBorderRadius is a enum that has access to radius properties from the Design System.
  This properties are used to set corner radius of view's layer.
  According with the current Brand in the Design System this properties can change.

    All properties returns a CGFloat.

    Exemple of usage:

        containerView.layer.cornerRadius = NatBorderRadius.small
        button.layer.cornerRadius = NatBorderRadius.circle(viewHeight: DSSizes.large)

 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public enum NatBorderRadius {
    public static var small: CGFloat { getTheme().borderRadius.small }
    public static var medium: CGFloat { getTheme().borderRadius.medium }
    public static var large: CGFloat { getTheme().borderRadius.large }
    public static func circle(viewHeight: CGFloat) -> CGFloat {
        getTheme().borderRadius.circle(viewHeight: viewHeight)
    }
}
