extension NatAvatar {
    /**
     Style is a enum that represents style values for  NatAvatar component.

        These are the allowed styles for a NatAvatar:
        - icon
        - letter
        - image

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */
    public enum Style: CaseIterable {
        case icon
        case letter
        case image
    }
}
