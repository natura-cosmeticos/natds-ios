import Foundation

@testable import NatDS

final class TextFieldDelegateMock: TextFieldDelegate {

    var invokedDidBeginEditing: (count: Int, field: TextField?) = (count: 0, field: nil)
    var invokedDidEndEditing: (count: Int, field: TextField?) = (count: 0, field: nil)
    var invokedDidShouldBeginEditing: (count: Int, field: TextField?) = (count: 0, field: nil)
    var invokedTextFieldChangeCharInRange: (count: Int, field: TextField?) = (count: 0, field: nil)

    func natTextFieldDidBeginEditing(_ textField: TextField) {
        invokedDidBeginEditing.count += 1
        invokedDidBeginEditing.field = textField
    }

    func natTextFieldDidEndEditing(_ textField: TextField) {
        invokedDidEndEditing.count += 1
        invokedDidEndEditing.field = textField
    }

    func natTextFieldShouldBeginEditing(_ textField: TextField) -> Bool {
        invokedDidShouldBeginEditing.count += 1
        invokedDidShouldBeginEditing.field = textField
        return true
    }

    func natTextField(_ textField: TextField, changeCharInRange: NSRange, string: String) -> Bool {
        invokedTextFieldChangeCharInRange.count += 1
        invokedTextFieldChangeCharInRange.field = textField
        return true
    }
}
