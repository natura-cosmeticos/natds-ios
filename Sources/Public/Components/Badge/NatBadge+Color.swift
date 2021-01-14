extension NatBadge {
    /**
     Color is a enum that represents color values for the NatBadge component.

        These are the allowed colors for a NatBadge:
        - Alert

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */

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
