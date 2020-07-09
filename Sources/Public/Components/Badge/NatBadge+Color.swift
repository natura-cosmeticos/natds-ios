extension NatBadge {
    public enum Color {
        case alert
    }
}

extension NatBadge.Color {
    var cgColors: (shape: CGColor, content: CGColor) {
        switch self {
        case .alert:
            return (shape: getTheme().colors.alert.cgColor, content: getTheme().colors.onAlert.cgColor)
        }
    }
}
