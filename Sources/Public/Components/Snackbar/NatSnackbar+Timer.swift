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
        case custom(TimeInterval)
        
        var interval: TimeInterval? {
            switch self {
            case .minimum:
                return 5
            case .intermediary:
                return 10
            case .indeterminate:
                return nil
            case .custom(let interval):
                return interval
            }
        }
    }
}
