extension NatLogo {
    /**
DOCS
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
