extension NatProgressIndicatorCircular {
    public enum Size: CGFloat {
        case standard
        case semi
        case medium
        case large

        var value: CGFloat {
            switch self {
            case .standard: return getTokenFromTheme(\.sizeStandard)
            case .semi: return getTokenFromTheme(\.sizeSemi)
            case .medium: return getTokenFromTheme(\.sizeMedium)
            case .large: return getTokenFromTheme(\.sizeLarge)
            }
        }
    }
}
