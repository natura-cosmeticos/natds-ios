extension GaYaTag {
    /**
     Size is an enum that represents the possible sizes for the GaYaTag height.
     The default size is `small`.

     These are all sizes allowed for a NatTag:
     - small
     - medium
     */

    public enum Size: CaseIterable {
        case small
        case medium

        var value: CGFloat {
            switch self {
            case .small:
                return getTokenFromTheme(\.sizeSmall)
            case .medium:
                return getTokenFromTheme(\.sizeMedium)
            }
        }

        var iconSize: CGFloat {
            let iconPadding: CGFloat = 3
            switch self {
            case .small:
                return getTokenFromTheme(\.sizeSmall) - iconPadding
            case .medium:
                return getTokenFromTheme(\.sizeMedium) - iconPadding
            }
        }
    }
}
