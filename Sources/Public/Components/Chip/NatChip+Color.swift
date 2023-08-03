/**
 Color is a enum that represents the color options for the chip component.
 
 These are all color allowed for a chip:
 - neutral
 - primary
 - secondary
 - custom
 */
extension NatChip {

    public enum Color {
        case neutral
        case primary
        case secondary
        case custom(selectedColor: UIColor,
                    labelColor: UIColor,
                    borderColor: UIColor)

        var selectedColor: UIColor {
            switch self {
            case .neutral:
                return NatColors.primary
            case .primary:
                return NatColors.primary
            case .secondary:
                return NatColors.secondary
            case .custom(let color, _, _):
                return color
            }
        }

        var labelColor: UIColor {
            switch self {
            case .neutral:
                return NatColors.onPrimary
            case .primary:
                return NatColors.onPrimary
            case .secondary:
                return NatColors.onSecondary
            case .custom(_, let color, _):
                return color
            }
        }

        var borderColor: UIColor {
            switch self {
            case .neutral:
                return NatColors.lowEmphasis
            case .primary:
                return NatColors.primary
            case .secondary:
                return NatColors.secondary
            case .custom(_, _, let color):
                return color
            }
        }
    }
    
    public struct ThemeColor {
        private let theme: AvailableTheme
        private let colorType: Color


        public init(theme: AvailableTheme, colorType: Color) {
            self.theme = theme
            self.colorType = colorType
        }

        public var selectedColor: UIColor {
            switch colorType {
            case .primary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorPrimary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary)
                }
            case .secondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSecondary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary)
                }
            
            case .neutral:
                if theme == .none {
                    return getUIColorFromTokens(\.colorPrimary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary)
                }
            
            case .custom(selectedColor: let selectedColor, labelColor: _, borderColor: _):
                return selectedColor
            }
        }
        
        public var labelColor: UIColor {
            switch colorType {
            case .primary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnPrimary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary)
                }
            case .secondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnSecondary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorOnSecondary)
                }
            case .neutral:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnPrimary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary)
                }
                
            case .custom(selectedColor: _, labelColor: let labelColor, borderColor: _):
                return labelColor
            }
        }
        
        public var borderColor: UIColor {
            switch colorType {
            case .primary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorPrimary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary)
                }
            case .secondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSecondary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary)
                }
            case .neutral:
                    return NatColors.lowEmphasis
            case .custom(selectedColor: _, labelColor: _, borderColor: let borderColor):
                return borderColor
            }
        }
    }
}
