extension NatIconButton {

    /**
     Background represents style values for the NatIconButton component, which apply different colors for the icon.
     
     These are all the backgrounds allowed for a NatIconButton:
     - inherit (default)
     - float
     - overlay
     */

    public enum Background {
        case float
        case inherit
        case overlay

        var color: UIColor {
            switch self {
            case .float: return getUIColorFromTokens(\.colorSurface)
            case .inherit: return .clear
            case .overlay: return getUIColorFromTokens(\.colorHighlight)
                .withAlphaComponent(getTokenFromTheme(\.opacityDisabledLow))
            }
        }

        var hasElevation: Bool {
            switch self {
            case .float: return true
            default: return false
            }
        }
    }
}
