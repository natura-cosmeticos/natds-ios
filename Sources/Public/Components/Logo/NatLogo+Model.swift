extension NatLogo {
    /**
     Model is a enum that represents model options for NatLogo image.
     
     These are all model options:
     - modelA (A)
     - modelB (B)
     */

    public enum Model {
        case modelA
        case modelB

        var neutralImage: UIImage? {
            switch self {
            case .modelA: return AssetsHelper.logo(from: getTokenFromTheme(\.assetBrandNeutralA))
            case .modelB: return AssetsHelper.logo(from: getTokenFromTheme(\.assetBrandNeutralB))
            }
        }

        var customImage: UIImage? {
            switch self {
            case .modelA: return AssetsHelper.logo(from: getTokenFromTheme(\.assetBrandCustomA))
            case .modelB: return AssetsHelper.logo(from: getTokenFromTheme(\.assetBrandCustomB))
            }
        }
    }
}
