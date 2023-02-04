extension NatSnackbar {
    /**
     Timer is a enum that represents the duration of the NatSnackbar component apperance on screen.

        These are the types of timer:
        - minimum (5 seconds)
        - intermediary (10 seconds)
        - indeterminate (no set time)
        - custom

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */

    public enum Timer {
        case minimum
        case intermediary
        case indeterminate
        case custom(Int)
    }
}
