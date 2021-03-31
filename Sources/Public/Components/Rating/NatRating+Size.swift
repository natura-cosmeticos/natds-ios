extension NatRating {
    public enum Size {
        case small
        case standard
        case semi
        case semiX
        case medium

        var value: CGFloat {
            switch self {
            case .small: return getTokenFromTheme(\.sizeSmall)
            case .standard: return getTokenFromTheme(\.sizeStandard)
            case .semi: return getTokenFromTheme(\.sizeSemi)
            case .semiX: return getTokenFromTheme(\.sizeSemiX)
            case .medium: return getTokenFromTheme(\.sizeMedium)
            }
        }
    }
}
