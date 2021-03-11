extension NatAvatar {
    /**
     Size is a enum that represents size values for NatAvatar component.
     
     These are all sizes allowed for a NatAvatar:
     - standard
     - semi
     - semiX
     - medium
     - largeXXX
     
     - Requires:
     It's necessary to configure the Design System with a theme or fatalError will be raised.
     
            DesignSystem().configure(with: AvailableTheme)
     */

    public enum Size: CaseIterable {
        case standard
        case semi
        case semiX
        case medium
        case largeXXX
    }
}

extension NatAvatar.Size {
    var value: CGFloat {
        switch self {
        case .standard:
            return getTokenFromTheme(\.sizeStandard)
        case .semi:
            return getTokenFromTheme(\.sizeSemi)
        case .semiX:
            return getTokenFromTheme(\.sizeSemiX)
        case .medium:
            return getTokenFromTheme(\.sizeMedium)
        case .largeXXX:
            return getTokenFromTheme(\.sizeLargeXXX)
        }
    }
    
    var font: UIFont {
        switch self {
        case .standard:
            return NatFonts.font(ofSize: .caption)
        case .semi:
            return NatFonts.font(ofSize: .body2)
        case .semiX:
            return NatFonts.font(ofSize: .heading6)
        case .medium:
            return NatFonts.font(ofSize: .heading5)
        case .largeXXX:
            return NatFonts.font(ofSize: .heading3)
        }
    }
}
