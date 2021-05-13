import Foundation

@testable import NatDS

class TextFieldDelegateMock: NSObject {
    var invokedDidBeginEditing: (count: Int, field: UITextField?) = (count: 0, field: nil)
    var invokedDidEndEditing: (count: Int, field: UITextField?) = (count: 0, field: nil)
    var invokedDidShouldBeginEditing: (count: Int, field: UITextField?) = (count: 0, field: nil)
    var invokedTextFieldChangeCharInRange: (count: Int, field: UITextField?) = (count: 0, field: nil)
}

extension TextFieldDelegateMock: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        invokedDidBeginEditing.count += 1
        invokedDidBeginEditing.field = textField
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        invokedDidEndEditing.count += 1
        invokedDidEndEditing.field = textField
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        invokedDidShouldBeginEditing.count += 1
        invokedDidShouldBeginEditing.field = textField
        return true
    }

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        invokedTextFieldChangeCharInRange.count += 1
        invokedTextFieldChangeCharInRange.field = textField
        return true
    }
}
