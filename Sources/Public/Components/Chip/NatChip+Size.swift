extension NatChip {
    /**
     Size is an enum that represents the possible sizes for the NatChip size.
     The default size is `semi`.
     
     These are all sizes allowed for a NatChip:
     - semi
     - semiX
     - medium
     */
    public enum Size: CaseIterable {
        case semi
        case semiX
        case medium

        var value: CGFloat {
            switch self {
            case .semi:
                return getTokenFromTheme(\.sizeSemi)
            case .semiX:
                return getTokenFromTheme(\.sizeSemiX)
            case .medium:
                return getTokenFromTheme(\.sizeMedium)
            }
        }
    }
}
