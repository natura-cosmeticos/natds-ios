extension NatImage {

    /**
     Sizes is a enum that represents size values for the NatIconButton component.
     
     These are all sizes allowed for a NatIconButton:
     - semi (default)
     - semiX
     - medium
     */

    public enum ImageType {
        case standard
        case highlight
    }

    public enum ImageRadius {
        case none
        case medium
        case circle(imageHeight: CGFloat)

        var value: CGFloat {
            switch self {
            case .none: return getTokenFromTheme(\.borderRadiusNone)
            case .medium: return getTokenFromTheme(\.borderRadiusMedium)
            case .circle(let height): return NatBorderRadius.circle(viewHeight: height)
            }
        }
    }

    public enum ImageFadeDirection {
        case left
        case top
        case right
        case bottom
    }
}
