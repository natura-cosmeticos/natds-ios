extension NatButton {
    /**
     IconSide is a enum that represents the icon side options for the button component.

        These are all sides allowed for a icon in NatButton:
        - right
        - left

        usage example:

            button.configure(title: "exampleTitle", icon: .exampleIcon, iconSide: .left)

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */

    public enum IconSide {
        case left
        case right
    }
}
