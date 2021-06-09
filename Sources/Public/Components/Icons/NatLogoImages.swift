/**
  NatLogoImages is a struct with all logo images from the design system.
  The Images changes according with the current Brand configured in the Design system
  and according with user properties of Light and Dark mode.

    This struct has 2 variants:
    - horizontal
    - vertical

    Example of usage:

        let logoHorizontal = NatLogoImages.horizontal
        let logoVertical = NatLogoImages.vertical

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

@available(*, deprecated, message: "Use NatLogo component instead")
public struct NatLogoImages {
    public static var horizontal: UIImage? {
        AssetsHelper.logo(from: getTokenFromTheme(\.assetBrandNeutralA))
    }

    public static var vertical: UIImage? {
        AssetsHelper.logo(from: getTokenFromTheme(\.assetBrandNeutralB))
    }
}
