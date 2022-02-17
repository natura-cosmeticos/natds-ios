extension NatIconButton {

    /**
     Sizes is a enum that represents size values for the NatIconButton component.
     
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

        var borderRadius: CGFloat {
            switch self {
            case .semi: return getComponentAttributeFromTheme(\.iconButtonSemiBorderRadius)
            case .semiX: return getComponentAttributeFromTheme(\.iconButtonSemiXBorderRadius)
            case .medium: return getComponentAttributeFromTheme(\.iconButtonMediumBorderRadius)
            }
        }
    }
}
