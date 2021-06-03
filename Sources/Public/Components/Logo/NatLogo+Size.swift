extension NatLogo {
    /**
DOCS
     */

    public enum Size {
        case medium
        case mediumX
        case large
        case largeX
        case largeXX
        case largeXXX
        case huge
        case hugeX
        case hugeXX
        case hugeXXX
        case veryHuge

        var value: CGFloat {
            switch self {
            case .medium: return getTokenFromTheme(\.sizeMedium)
            case .mediumX: return getTokenFromTheme(\.sizeMediumX)
            case .large: return getTokenFromTheme(\.sizeLarge)
            case .largeX: return getTokenFromTheme(\.sizeLargeX)
            case .largeXX: return getTokenFromTheme(\.sizeLargeXX)
            case .largeXXX: return getTokenFromTheme(\.sizeLargeXXX)
            case .huge: return getTokenFromTheme(\.sizeHuge)
            case .hugeX: return getTokenFromTheme(\.sizeHugeX)
            case .hugeXX: return getTokenFromTheme(\.sizeHugeXX)
            case .hugeXXX: return getTokenFromTheme(\.sizeHugeXXX)
            case .veryHuge: return getTokenFromTheme(\.sizeVeryHuge)
            }
        }
    }
}
