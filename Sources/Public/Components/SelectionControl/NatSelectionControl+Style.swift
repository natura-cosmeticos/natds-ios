import Foundation
import UIKit

extension NatSelectionControl {

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
