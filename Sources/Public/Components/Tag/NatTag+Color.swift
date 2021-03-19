extension NatTag {
    /**
     Size is an enum that represents the possible colors for the NatTag.
     The default size is `Primary`.

     These are all colors allowed for a NatTag:
     - primary
     - secondary
     - success
     - alert
     - `warning
     - link
     */

    public enum Color: CaseIterable {
        case primary
        case secondary
        case success
        case alert
        case warning
        case link

        var tag: String {
            switch self {
            case .primary:
                return getTokenFromTheme(\.colorPrimary)
            case .secondary:
                return getTokenFromTheme(\.colorSecondary)
            case .success:
                return getTokenFromTheme(\.colorSuccess)
            case .alert:
                return getTokenFromTheme(\.colorAlert)
            case .warning:
                return getTokenFromTheme(\.colorWarning)
            case .link:
                return getTokenFromTheme(\.colorLink)
            }
        }

        var label: String {
            switch self {
            case .primary:
                return getTokenFromTheme(\.colorOnPrimary)
            case .secondary:
                return getTokenFromTheme(\.colorOnSecondary)
            case .success:
                return getTokenFromTheme(\.colorOnSuccess)
            case .alert:
                return getTokenFromTheme(\.colorOnAlert)
            case .warning:
                return getTokenFromTheme(\.colorOnWarning)
            case .link:
                return getTokenFromTheme(\.colorOnLink)
            }
        }
    }
}
