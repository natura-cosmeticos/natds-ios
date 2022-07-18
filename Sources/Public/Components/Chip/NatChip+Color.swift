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
        case custom(_ : UIColor)

        var uiColor: UIColor {
            switch self {
            case .neutral:
                return NatColors.lowEmphasis
            case .primary:
                return NatColors.primary
            case .secondary:
                return NatColors.secondary
            case .custom(let color):
                return color
            }
        }
    }
}
