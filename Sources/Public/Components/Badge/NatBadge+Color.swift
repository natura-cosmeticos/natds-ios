extension NatBadge {
    public enum Color {
        case alert
    }
}

extension NatBadge.Color {
    var box: UIColor {
        switch self {
        case .alert:
            return getTheme().colors.alert
        }
    }

    var content: UIColor {
        switch self {
        case .alert:
            return getTheme().colors.onAlert
        }
    }
}
