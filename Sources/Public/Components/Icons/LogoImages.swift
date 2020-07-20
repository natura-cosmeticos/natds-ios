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
