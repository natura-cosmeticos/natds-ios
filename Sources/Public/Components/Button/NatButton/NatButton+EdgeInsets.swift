extension NatButton {
    /**
      EdgeInsets is a enum that represents contentEdgeInsets values of button component.

        These are all edgeInsets allowed for a NatButton:
        - small
        - medium
        - large

        usage example:

            let button = NatButton(style: .contained)
            button.contentEdgeInsets = .small

     - Requires:
            It's necessary to configure the Design System current Brand at DesignSystem class
            or fatalError will be raised.

                DesignSystem().configure(with: Brand)
    */

    public enum EdgeInsets {
        public static var small: UIEdgeInsets { .init(spacing: getTheme().spacing.small) }
        public static var medium: UIEdgeInsets { .init(spacing: getTheme().spacing.small) }
        public static var large: UIEdgeInsets { .init(spacing: getTheme().spacing.small) }
    }
}

private extension UIEdgeInsets {
    init(spacing: CGFloat) {
        self.init(
            top: spacing,
            left: spacing,
            bottom: spacing,
            right: spacing
        )
    }
}
