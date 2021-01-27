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
        case `switch`
    }
}

extension NatSelectionControl.Style {
    func getSelector() -> NatSelector {
        switch self {
        case .checkbox: return NatCheckboxContainer()
        case .radioButton: return NatRadioButtonContainer()
        case .switch: return NatSwitchContainer()
        }
    }
}
