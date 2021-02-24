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
//            return NatFonts.font(ofSize: .caption)
            return NatFonts.font(ofSize: .heading6)
        case .semi:
//            return NatFonts.font(ofSize: .body1)
            return NatFonts.font(ofSize: .heading6)
        case .semiX:
//            return NatFonts.font(ofSize: .body1)
            return NatFonts.font(ofSize: .heading6)
        case .medium:
            return NatFonts.font(ofSize: .heading6)
        case .largeXXX:
            return NatFonts.font(ofSize: .heading6)
        }
    }
}
