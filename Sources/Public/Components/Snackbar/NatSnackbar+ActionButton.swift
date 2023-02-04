extension NatSnackbar {
    /**
     ActionButtonType is a enum that represents the type of the action button inside the NatSnackbar component.

        These are the types of action button inside the NatSnackbar:
        - none
        - button
        - iconButton

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */

    public enum ActionButton {
        case none
        case button(title: String)
        case iconButton(icon: String)
    }
}
