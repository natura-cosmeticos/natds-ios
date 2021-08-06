extension NatImage {

    /// ImageRadius is an enum that represents the radius values for NatImage
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
}
