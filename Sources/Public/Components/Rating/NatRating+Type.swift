extension NatRating {
    public enum Style {
        case input
        case counter
        case readOnly

        var emptyStarImage: UIImage? {
            switch self {
            case .readOnly:
                let image = AssetsPath.iconFilledActionRating.rawValue
                return image?.tintedWithColor(getUIColorFromTokens(\.colorMediumEmphasis))
            default:
                let image = AssetsPath.iconOutlinedActionRating.rawValue
                return image?.tintedWithColor(getUIColorFromTokens(\.colorMediumEmphasis))
            }
        }

        func filledStarImage(for state: State) -> UIImage? {
            let image = AssetsPath.iconFilledActionRating.rawValue
            if self == .input, state == .disabled {
                return image?.tintedWithColor(getUIColorFromTokens(\.colorMediumEmphasis))
            }
            return image?.tintedWithColor(UIColor(red: 0.97, green: 0.71, blue: 0.27, alpha: 1.00))
        }

        var font: UIFont {
            switch self {
            case .counter:
                return NatFonts.font(ofSize: .body2)
            default:
                return NatFonts.font(ofSize: .caption)
            }
        }

        var fontColor: UIColor {
            return getUIColorFromTokens(\.colorMediumEmphasis)
        }

        var canShowHint: Bool {
            switch self {
            case .input:
                return true
            default:
                return false
            }
        }
    }
}
