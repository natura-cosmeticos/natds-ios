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
            return getUIColorFromComponentAttributes(\.badgeColorAlertBackground)

        case .primary:
            return getUIColorFromComponentAttributes(\.badgeColorPrimaryBackground)

        case .secondary:
            return getUIColorFromComponentAttributes(\.badgeColorSecondaryBackground)

        case .success:
            return getUIColorFromComponentAttributes(\.badgeColorSuccessBackground)
        }
    }

    var content: UIColor {
        switch self {
        case .alert:
            return getUIColorFromComponentAttributes(\.badgeColorAlertLabel)

        case .primary:
            return getUIColorFromComponentAttributes(\.badgeColorPrimaryLabel)

        case .secondary:
            return getUIColorFromComponentAttributes(\.badgeColorSecondaryLabel)

        case .success:
            return getUIColorFromComponentAttributes(\.badgeColorSuccessLabel)
        }
    }
}
