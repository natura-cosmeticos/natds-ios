/// AppBarColor represents the allowed color values for the AppBar Top component
/// The component is configured using UINavigationController and UIViewController extensions.
public enum AppBarColor {
    case `default`
    case primary
    case secondary
    case none
    case inverse

    var backgroundColor: UIColor {
        switch self {
        case .default: return getUIColorFromTokens(\.colorSurface)
        case .primary: return getUIColorFromTokens(\.colorPrimary)
        case .secondary: return getUIColorFromTokens(\.colorSecondary)
        case .none: return .clear
        case .inverse: return getUIColorFromTokens(\.colorHighEmphasis)
        }
    }

    var contentColor: UIColor {
        switch self {
        case .default: return getUIColorFromTokens(\.colorOnSurface)
        case .primary: return getUIColorFromTokens(\.colorOnPrimary)
        case .secondary: return getUIColorFromTokens(\.colorOnSecondary)
        case .none: return getUIColorFromTokens(\.colorHighlight)
        case .inverse: return getUIColorFromTokens(\.colorSurface)
        }
    }
}
