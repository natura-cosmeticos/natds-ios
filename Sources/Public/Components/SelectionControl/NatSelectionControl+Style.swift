import Foundation
import UIKit

extension NatSelectionControl {

    public enum Style {
        case checkbox
        case radio
        case `switch`
    }
}

extension NatSelectionControl.Style {

    func getSelectorView() -> UIView {
        switch self {
        case .checkbox: return NatCheckbox()
        case .radio: return NatRadio()
        case .switch: return NatSwitch()
        }
    }
}

private final class NatCheckbox: UIView {

}

private final class NatRadio: UIView {

}

private final class NatSwitch: UISwitch {

}
