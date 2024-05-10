extension GaYaButton {
    /**
     Height is a enum that represents height values for the button component.
     
     These are all sizes allowed for a GaYaButton:
     - small
     - medium (should be default)
     - large
     
     Example of usage:
     
            button.heightAnchor.constraint(equalToConstant: GaYaButton.Height.medium)
     
     - Requires:
     It's necessary to configure the Design System with a theme or fatalError will be raised.
     
            DesignSystem().configure(with: AvailableTheme)
     */

    public enum Height {
        
        public static var small: CGFloat { getTokenFromTheme(\.sizeSemi) }
        public static var medium: CGFloat { getTokenFromTheme(\.sizeSemiX) }
        public static var large: CGFloat { getTokenFromTheme(\.sizeMedium) }
        
    }
    
    public enum GayaButtonHeight {
        case medium
        case semix
        case semi
    }
}
