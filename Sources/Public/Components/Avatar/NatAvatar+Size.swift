extension NatAvatar {
    public enum Style {
        case small
        case medium
        case large
        case largeX
    }
}

extension NatAvatar.Style {
    var size: CGFloat {
        switch self {
        case .small:
            return getTokenFromTheme(\.sizeSmall)
        case .medium:
            return getTokenFromTheme(\.sizeMedium)
        case .large:
            return getTokenFromTheme(\.sizeLarge)
        case .largeX:
            return getTokenFromTheme(\.sizeLargeX)
        }
    }
    
    var font: UIFont {
        switch self {
        case .small:
            return NatFonts.font(ofSize: .heading6)
        case .medium:
            return NatFonts.font(ofSize: .heading6)
        case .large:
            return NatFonts.font(ofSize: .heading6)
        case .largeX:
            return NatFonts.font(ofSize: .heading6)
        }
    }
}
