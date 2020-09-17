extension NatBadge {
    public enum Color {
        case alert
    }
}

extension NatBadge.Color {
    var box: UIColor {
        switch self {
        case .alert:
            return getUIColorFromTokens(\.colorAlert)
        }
    }

    var content: UIColor {
        switch self {
        case .alert:
            return getUIColorFromTokens(\.colorOnAlert)
        }
    }
}
