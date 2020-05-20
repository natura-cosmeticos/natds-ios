extension NatButton {
    public enum Height {
        case small
        case medium
        case large

        var rawValue: CGFloat {
            switch self {
            case .small: return getTheme().sizes.semi
            case .medium: return getTheme().sizes.semiX
            case .large: return getTheme().sizes.medium
            }
        }
    }
}
