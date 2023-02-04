extension NatSnackbar {
    /**
     Position is a enum that represents the position where NatSnackbar component will appear.

        These are the types of position:
        - topCenter
        - bottomCenter

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */

    public enum Position {
        case topCenter
        case bottomCenter
    }
}
