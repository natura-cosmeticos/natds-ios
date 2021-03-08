extension TextField {
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
