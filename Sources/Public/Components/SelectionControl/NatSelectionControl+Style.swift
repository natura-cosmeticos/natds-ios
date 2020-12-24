import Foundation
import UIKit

extension NatSelectionControl {

    public enum Style {
        case checkbox
    }
}

extension NatSelectionControl.Style {

    func getSelector() -> UIControl {
        switch self {
        case .checkbox: return NatCheckboxContainer()
        }
    }
}
