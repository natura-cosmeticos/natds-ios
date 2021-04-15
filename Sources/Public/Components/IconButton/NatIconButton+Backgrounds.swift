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

        var enabledColor: UIColor {
            switch self {
            case .float: return getUIColorFromTokens(\.colorSurface)
            case .inherit: return .clear
            case .overlay: return getUIColorFromTokens(\.colorHighlight)
                .withAlphaComponent(getTokenFromTheme(\.opacityMediumHigh))
            }
        }

        var disabledColor: UIColor {
            switch self {
            case .float: return getUIColorFromTokens(\.colorLowEmphasis)
            case .inherit: return .clear
            case .overlay: return getUIColorFromTokens(\.colorHighlight)
                .withAlphaComponent(getTokenFromTheme(\.opacityMediumHigh))
            }
        }

        var disabledIconColor: UIColor {
            switch self {
            case .overlay: return getUIColorFromTokens(\.colorLowEmphasis)
            default: return getUIColorFromTokens(\.colorMediumEmphasis)
            }
        }

        var enabledElevation: NatElevation.Elevation {
            switch self {
            case .float: return .medium
            default: return .none
            }
        }

        var disabledElevation: NatElevation.Elevation {
            return .none
        }
    }
}
