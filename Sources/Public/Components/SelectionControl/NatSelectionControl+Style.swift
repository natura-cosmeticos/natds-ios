import UIKit

extension NatSelectionControl {
    /**
     Style represents styles values for the NatSelectionControl component.

        These are all styles allowed for a NatSelectionControl:
        - checkbox
    */
    
    public enum Style {
        case checkbox
    }
}

extension NatSelectionControl.Style {

    func getSelector() -> NatSelector {
        switch self {
        case .checkbox: return NatCheckboxContainer()
        }
    }
}
