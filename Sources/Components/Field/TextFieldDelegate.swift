public protocol TextFieldDelegate: class {

    func textFieldDidBeginEditing(_ textField: TextField)
    func textFieldDidEndEditing(_ textField: TextField)
    func textFieldShouldBeginEditing(_ textField: TextField) -> Bool
    func textField(_ textField: TextField, changeCharInRange: NSRange, string: String) -> Bool
}

public extension TextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: TextField) { }
    func textFieldDidEndEditing(_ textField: TextField) { }
    func textFieldShouldBeginEditing(_ textField: TextField) -> Bool { return true }
    func textField(_ textField: TextField, changeCharInRange: NSRange, string: String) -> Bool { return true }
}
