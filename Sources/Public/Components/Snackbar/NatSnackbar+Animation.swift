extension NatSnackbar {
    /**
     Animation is a enum that represents the animation style of the NatSnackbar component apperance on screen.

        These are the types of animation:
        - none
        - center
        - left
        - right
     

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */

    public enum Animation {
        case none
        case center
        case left
        case right
    }
}
