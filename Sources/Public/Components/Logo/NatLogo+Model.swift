extension NatLogo {
    /**
DOCS
     */

    public enum Model {
        case modelA
        case modelB

        var neutralImage: UIImage? {
            switch self {
            case .modelA: return AssetsHelper.image(from: getTokenFromTheme(\.assetBrandNeutralA))
            case .modelB: return AssetsHelper.image(from: getTokenFromTheme(\.assetBrandNeutralB))
            }
        }

        var customImage: UIImage? {
            switch self {
            case .modelA: return AssetsHelper.image(from: getTokenFromTheme(\.assetBrandCustomA))
            case .modelB: return AssetsHelper.image(from: getTokenFromTheme(\.assetBrandCustomB))
            }
        }
    }
}
