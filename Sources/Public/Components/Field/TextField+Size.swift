extension TextField {
    /**
     Size is an enum that represents the possible sizes for the TextField height.
     The default size is `mediumX`.
     
     These are all sizes allowed for a TextField:
     - medium
     - mediumX
     */
    public enum Size: CaseIterable {
        case medium
        case mediumX

        var value: CGFloat {
            switch self {
            case .medium:
                return getTokenFromTheme(\.sizeMedium)
            case .mediumX:
                return getTokenFromTheme(\.sizeMediumX)
            }
        }
    }
}
