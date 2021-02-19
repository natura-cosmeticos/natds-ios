extension NatButton {
    /**
     EdgeInsets is a enum that represents `contentEdgeInsets` values of button component.
     
     These are all `edgeInsets allowed for a NatButton:
     - small
     - medium (default)
     - large
     
     Example of usage:
     
            let button = NatButton(style: .contained)
            button.contentEdgeInsets = NatButton.EdgeInsets.medium

     - Requires:
     It's necessary to configure the Design System with a theme or fatalError will be raised.
     
            DesignSystem().configure(with: AvailableTheme)
     */

    public enum EdgeInsets {
        public static var small: UIEdgeInsets { .init(spacing: 8) }
        public static var medium: UIEdgeInsets { .init(spacing: 12) }
        public static var large: UIEdgeInsets { .init(spacing: 16) }
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
