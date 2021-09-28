extension NatBadge {
    /**
     Style is a enum that represents style values for the NatBadge component.

        These are the allowed styles for a NatBadge:
        - Standard
        - Dot

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */

    public enum Style {
        case standard
        case dot
        case pulse
        
        var height: CGFloat {
            switch self {
            case .standard:
                return getComponentAttributeFromTheme(\.badgeStandardHeight)
            case .dot:
                return getComponentAttributeFromTheme(\.badgeDotHeight)
            case .pulse:
                return getComponentAttributeFromTheme(\.badgeDotHeight)
            }
        }

        var borderRadius: CGFloat {
            switch self {
            case .standard:
                return getComponentAttributeFromTheme(\.badgeStandardBorderRadius)
            case .dot:
                return getComponentAttributeFromTheme(\.badgeDotBorderRadius)
            case .pulse:
                return getComponentAttributeFromTheme(\.badgeDotBorderRadius)
            }
        }
    }
}
