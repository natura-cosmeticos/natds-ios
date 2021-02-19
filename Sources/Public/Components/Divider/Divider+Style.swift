extension Divider {
    /**
     Style is a enum that represents style values for the divider component.
     Each style has a predefined spacing from right and left margins on the screen.
     
     These are all styles allowed for a Divider:
     - full-bleed
     - inset
     - middle
     */
    public enum Styles {
        case fullBleed
        case inset
        case middle

        var spaceRight: CGFloat {
            switch self {
            case .fullBleed: return getTokenFromTheme(\.spacingNone)
            case .inset: return getTokenFromTheme(\.spacingNone)
            case .middle: return getTokenFromTheme(\.spacingStandard)
            }
        }

        var spaceLeft: CGFloat {
            switch self {
            case .fullBleed: return getTokenFromTheme(\.spacingNone)
            case .inset: return getTokenFromTheme(\.spacingStandard)
            case .middle: return getTokenFromTheme(\.spacingStandard)
            }
        }
    }
}
