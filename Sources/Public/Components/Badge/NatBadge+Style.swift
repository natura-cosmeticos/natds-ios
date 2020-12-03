extension NatBadge {
    /**
     Style is a enum that represents Style values for the NatBadge component.

        These are all styles allowed for a NatBadge:
        - standard

        Usage example:

            NatBadge(style: .standard, color: .alert)

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */

    public enum Style {
        case standard
    }
}
