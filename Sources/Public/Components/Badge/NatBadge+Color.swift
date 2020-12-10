extension NatBadge {
    /**
     Color is a enum that represents Color values for the NatBadge component.

        These are all Color allowed for a NatBadge:
        - alert

        Usage example:

            NatBadge(style: .standard, color: .alert)

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
