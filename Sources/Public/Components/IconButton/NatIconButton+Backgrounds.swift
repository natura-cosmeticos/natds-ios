extension NatIconButton {
    /**
     docs
     */
    public enum Backgrounds {
        case float
        case inherit
        case overlay

        var color: UIColor {
            switch self {
            case .float: return getUIColorFromTokens(\.colorSurface)
            case .inherit: return .clear
            case .overlay: return getUIColorFromTokens(\.colorHighlight)
                .withAlphaComponent(getTokenFromTheme(\.opacityDisabledLow))
            }
        }

        var hasElevation: Bool {
            switch self {
            case .float: return true
            default: return false
            }
        }
    }
}
