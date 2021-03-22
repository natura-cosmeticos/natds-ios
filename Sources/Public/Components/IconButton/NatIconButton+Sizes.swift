extension NatIconButton {
    /**
     Sizes is a enum that represents sizes values for the NatIconButton component.
     It helps to configure height and width constraints.
     
     These are all sizes allowed for a NatIconButton:
     - semi (default)
     - semiX
     - medium
     */
    public enum Sizes {
        case semi
        case semiX
        case medium

        var value: CGFloat {
            switch self {
            case .semi: return getTokenFromTheme(\.sizeSemi)
            case .semiX: return getTokenFromTheme(\.sizeSemiX)
            case .medium: return getTokenFromTheme(\.sizeMedium)
            }
        }

        var fontSize: CGFloat {
            switch self {
            case .semi: return getTokenFromTheme(\.sizeStandard)
            case .semiX: return getTokenFromTheme(\.sizeSemi)
            case .medium: return getTokenFromTheme(\.sizeSemiX)
            }
        }
    }
}
