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

        func neutralImage(with languageSuffix: String) -> UIImage? {
            let tokenName: String
            switch self {
            case .modelA:
                tokenName = "assetBrandNeutralA\(languageSuffix)File"
            case .modelB:
                tokenName = "assetBrandNeutralB\(languageSuffix)File"
            }
            guard let imageName = getTokenFromTheme(tokenName) as? String else {
                return nil
            }
            return AssetsHelper.logo(from: imageName)
        }

        func customImage(with languageSuffix: String) -> UIImage? {
            let tokenName: String
                switch self {
                case .modelA:
                    tokenName = "assetBrandCustomA\(languageSuffix)File"
                case .modelB:
                    tokenName = "assetBrandCustomB\(languageSuffix)File"
                }
                guard let imageName = getTokenFromTheme(tokenName) as? String else {
                    return nil
                }
                return AssetsHelper.logo(from: imageName)
        }
    }
    
    public enum Language: String {
        case none = ""
        case es = "Es"
        case pt = "Pt"
    }

}
