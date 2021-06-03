extension NatLogo {
    /**
     DOCS
     */

    public enum Color {
        case neutral
        case primary
        case secondary
        case highlight
        case surface

        var value: UIColor {
            switch self {
            case .neutral: return .clear
            case .primary: return getUIColorFromTokens(\.colorPrimary)
            case .secondary: return getUIColorFromTokens(\.colorSecondary)
            case .highlight: return getUIColorFromTokens(\.colorHighlight)
            case .surface: return getUIColorFromTokens(\.colorSurface)
            }
        }
    }
}
