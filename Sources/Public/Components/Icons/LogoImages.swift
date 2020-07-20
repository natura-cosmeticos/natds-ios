/**
  LogoImages is a struct with all logo images from the design system.
  The Images changes according with the current Brand configured in the Design system
  and according with user properties of Light and Dark mode.

    This button has 2 variants:
    - horizontal
    - vertical

    Example of usage:

        let logoHorizontal = LogoImages.horizontal
        let logoVertical = LogoImages.vertical

 - Requires:
        It's necessary to configure the Design System current Brand at DesignSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public struct LogoImages {
    public static var horizontal: UIImage? {
        guard let brand = DesignSystem().currentBrand else { return nil }

        switch brand {
        case .avon:
            return AssetsHelper.image(from: "Logo/Avon/Horizontal")
        case .natura:
            return AssetsHelper.image(from: "Logo/Natura/Horizontal")
        case .theBodyShop:
            return AssetsHelper.image(from: "Logo/TheBodyShop/Horizontal")
        }
    }

    public static var vertical: UIImage? {
        guard let brand = DesignSystem().currentBrand else { return nil }

        switch brand {
        case .avon:
            return AssetsHelper.image(from: "Logo/Avon/Vertical")
        case .natura:
            return AssetsHelper.image(from: "Logo/Natura/Vertical")
        case .theBodyShop:
            return AssetsHelper.image(from: "Logo/TheBodyShop/Vertical")
        }
    }
}
