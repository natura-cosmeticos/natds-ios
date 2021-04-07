extension NatBadge {
    /**
     Color is a enum that represents color values for the NatBadge component.

     These are the allowed colors for a NatBadge:
     - Alert
     - Primary
     - Secondary
     - Success

     - Requires:
     It's necessary to configure the Design System with a theme or fatalError will be raised.

     DesignSystem().configure(with: AvailableTheme)
     */

    public enum Color {
        case alert
        case primary
        case secondary
        case success
    }
}

extension NatBadge.Color {
    var box: UIColor {
        switch self {
        case .alert:
            return getUIColorFromTokens(\.colorAlert)

        case .primary:
            return getUIColorFromTokens(\.colorPrimary)

        case .secondary:
            return getUIColorFromTokens(\.colorSecondary)

        case .success:
            return getUIColorFromTokens(\.colorSuccess)
        }
    }

    var content: UIColor {
        switch self {
        case .alert:
            return getUIColorFromTokens(\.colorOnAlert)

        case .primary:
            return getUIColorFromTokens(\.colorOnPrimary)

        case .secondary:
            return getUIColorFromTokens(\.colorOnSecondary)

        case .success:
            return getUIColorFromTokens(\.colorOnSuccess)
        }
    }
}
