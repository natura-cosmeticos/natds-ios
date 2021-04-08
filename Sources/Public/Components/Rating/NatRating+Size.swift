extension NatRating {
    /**
     Size represents size values for NatRating component.
     
     These are all sizes allowed for a NatRating:
     - small
     - standard
     - semi (default)
     - semiX
     - medium
     
     > Note: the `small` and `standard` sizes should only be applied to `counter` and `readOnly` styles.
     */

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
