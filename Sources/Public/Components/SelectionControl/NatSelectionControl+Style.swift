import UIKit

extension NatSelectionControl {
    /**
     Style represents styles values for the NatSelectionControl component.
     
     These are all styles allowed for a NatSelectionControl:
     - checkbox
     - radioButton
     */
    public enum Style {
        case checkbox
        case radioButton

        var fontSize: CGFloat {
            switch self {
            case .checkbox: return getComponentAttributeFromTheme(\.checkboxLabelFontSize)
            case .radioButton: return getComponentAttributeFromTheme(\.radioButtonLabelFontSize)
            }
        }

        var fontFamily: String {
            switch self {
            case .checkbox: return getComponentAttributeFromTheme(\.checkboxLabelPrimaryFontFamily)
            case .radioButton: return getComponentAttributeFromTheme(\.radioButtonLabelPrimaryFontFamily)
            }
        }

        var fontWeight: UIFont.Weight {
            switch self {
            case .checkbox: return getComponentAttributeFromTheme(\.checkboxLabelPrimaryFontWeight)
            case .radioButton: return getComponentAttributeFromTheme(\.radioButtonLabelPrimaryFontWeight)
            }
        }

        var lineHeight: CGFloat {
            switch self {
            case .checkbox: return getComponentAttributeFromTheme(\.checkboxLabelLineHeight)
            case .radioButton: return getComponentAttributeFromTheme(\.radioButtonLabelLineHeight)
            }
        }

        var letterSpacing: CGFloat {
            switch self {
            case .checkbox: return getComponentAttributeFromTheme(\.checkboxLabelLetterSpacing)
            case .radioButton: return getComponentAttributeFromTheme(\.radioButtonLabelLetterSpacing)
            }
        }
    }
}

extension NatSelectionControl.Style {
    func getSelector() -> NatSelector {
        switch self {
        case .checkbox: return NatCheckboxContainer()
        case .radioButton: return NatRadioButtonContainer()
        }
    }
}
