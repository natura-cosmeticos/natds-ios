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
        It's necessary to configure the Design System current Brand at DesignSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public struct NatLogoImages {
    public static var horizontal: UIImage? {
        guard let theme = DesignSystem().currentTheme else { return nil }

        switch theme {
        case .avonDark, .avonLight:
            return AssetsHelper.image(from: "Logo/Avon/Horizontal")
        case .naturaDark, .naturaLight:
            return AssetsHelper.image(from: "Logo/Natura/Horizontal")
        case .theBodyShopDark, .theBodyShopLight:
            return AssetsHelper.image(from: "Logo/TheBodyShop/Horizontal")
        }
    }

    public static var vertical: UIImage? {
        guard let theme = DesignSystem().currentTheme else { return nil }

        switch theme {
        case .avonDark, .avonLight:
            return AssetsHelper.image(from: "Logo/Avon/Vertical")
        case .naturaDark, .naturaLight:
            return AssetsHelper.image(from: "Logo/Natura/Vertical")
        case .theBodyShopDark, .theBodyShopLight:
            return AssetsHelper.image(from: "Logo/TheBodyShop/Vertical")
        }
    }
}
