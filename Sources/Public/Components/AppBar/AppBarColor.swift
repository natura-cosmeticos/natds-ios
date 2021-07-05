public enum AppBarColor {
    case `default`
    case primary
    case none
    case inverse

    var backgroundColor: UIColor {
        switch self {
        case .default: return getUIColorFromTokens(\.colorSurface)
        case .primary: return getUIColorFromTokens(\.colorPrimary)
        case .none: return .clear
        case .inverse: return getUIColorFromTokens(\.colorHighEmphasis)
        }
    }

    var contentColor: UIColor {
        switch self {
        case .default: return getUIColorFromTokens(\.colorOnSurface)
        case .primary: return getUIColorFromTokens(\.colorOnPrimary)
        case .none: return getUIColorFromTokens(\.colorHighlight)
        case .inverse: return getUIColorFromTokens(\.colorSurface)
        }
    }
}
