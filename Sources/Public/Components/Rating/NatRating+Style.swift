extension NatRating {
    /**
     Style represents variants for NatRating, which apply different structures for the component.
     
     These are all styles allowed for a NatIconButton:
     - input (has 5 stars and expects an input from the user; can have a hint text label)
     - counter (has 1 star and shows a label with the description for the component)
     - readOnly (has 5 stars and can show a value, only for reading purposes)
     */

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
                let fontSize = getComponentAttributeFromTheme(\.ratingCounterLabelFontSize)
                let fontWeight = getComponentAttributeFromTheme(\.ratingCounterLabelPrimaryFontWeight)
                let fontFamily = getComponentAttributeFromTheme(\.ratingCounterLabelPrimaryFontFamily)
                
                return NatFonts.font(ofSize: fontSize,
                                     withWeight: fontWeight,
                                     withFamily: fontFamily)
            default:
                let fontSize = getComponentAttributeFromTheme(\.ratingInputLabelFontSize)
                let fontWeight = getComponentAttributeFromTheme(\.ratingInputLabelPrimaryFontWeight)
                let fontFamily = getComponentAttributeFromTheme(\.ratingInputLabelPrimaryFontFamily)
                
                return NatFonts.font(ofSize: fontSize,
                                     withWeight: fontWeight,
                                     withFamily: fontFamily)
            }
        }

        var lineHeight: CGFloat {
            switch self {
            case .counter:
                return getComponentAttributeFromTheme(\.ratingCounterLabelLineHeight)
            default:
                return getComponentAttributeFromTheme(\.ratingInputLabelLineHeight)
            }
        }

        var letterSpacing: CGFloat {
            switch self {
            case .counter:
                return getComponentAttributeFromTheme(\.ratingCounterLabelLetterSpacing)
            default:
                return getComponentAttributeFromTheme(\.ratingInputLabelLetterSpacing)
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
