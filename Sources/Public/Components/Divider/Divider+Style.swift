public enum Styles {
    case fullBleed
    case inset
    case middle

    var spaceRight: CGFloat {
        switch self {
        case .fullBleed: return getTokenFromTheme(\.spacingNone)
        case .inset: return getTokenFromTheme(\.spacingNone)
        case .middle: return getTokenFromTheme(\.spacingStandard)
        }
    }

    var spaceLeft: CGFloat {
        switch self {
        case .fullBleed: return getTokenFromTheme(\.spacingNone)
        case .inset: return getTokenFromTheme(\.spacingStandard)
        case .middle: return getTokenFromTheme(\.spacingStandard)
        }
    }
}
