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
}
