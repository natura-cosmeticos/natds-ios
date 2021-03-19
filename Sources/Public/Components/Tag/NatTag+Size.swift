extension NatTag {
    /**
     Size is an enum that represents the possible sizes for the NatTag height.
     The default size is `small`.

     These are all sizes allowed for a NatTag:
     - small
     - standard
     */
    
    public enum Size: CaseIterable {
        case small
        case standard

        var value: CGFloat {
            switch self {
            case .small:
                return getTokenFromTheme(\.sizeSmall)
            case .standard:
                return getTokenFromTheme(\.sizeStandard)
            }
        }
    }
}
