public struct IllustrationIcons {
    public struct Lined {
        public static let sad: UIImage? = AssetsHelper.image(from: "Illustration/Lined/Sad")
    }
}

public struct LogoImages {
    public static let horizontal: UIImage? = {
        guard let brand = DesignSystem().currentBrand else { return nil }

        switch brand {
        case .avon:
            return AssetsHelper.image(from: "Logo/Avon/Logo-Avon-Horizontal")
        case .natura:
            return AssetsHelper.image(from: "Logo/Natura/Logo-Natura-Horizontal")
        case .theBodyShop:
            return AssetsHelper.image(from: "Logo/TheBodyShop/Logo-TheBodyShop-Horizontal")
        }
    }()

    public static let vertical: UIImage? = {
        guard let brand = DesignSystem().currentBrand else { return nil }

        switch brand {
        case .avon:
            return AssetsHelper.image(from: "Logo/Avon/Logo-Avon-Vertical")
        case .natura:
            return AssetsHelper.image(from: "Logo/Natura/Logo-Natura-Vertical")
        case .theBodyShop:
            return AssetsHelper.image(from: "Logo/TheBodyShop/Logo-TheBodyShop-Vertical")
        }
    }()
}
