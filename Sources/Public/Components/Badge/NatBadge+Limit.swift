extension NatBadge {
    /**
     Limit is a enum that represents limits values for the NatBadge component.

        These are the allowed limits for a NatBadge:
        - max9: if you exceed 9, It will show 9+
        - max99: if you exceed 99, It will show 99+
        - unlimited: It will shows the right number that is set

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */

    public enum Limit {
        case max9
        case max99
        case unlimited
    }
}
