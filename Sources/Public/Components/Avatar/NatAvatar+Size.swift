extension NatAvatar {
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
            return NatFonts.font(ofSize: .overline)
        case .semi:
            return NatFonts.font(ofSize: .button)
        case .semiX:
            return NatFonts.font(ofSize: .subtitle2)
        case .medium:
            return NatFonts.font(ofSize: .heading6)
        case .largeXXX:
            return NatFonts.font(ofSize: .heading5)
        }
    }
}
