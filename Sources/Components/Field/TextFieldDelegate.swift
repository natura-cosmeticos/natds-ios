@objc public protocol TextFieldDelegate: class {

    @objc optional func textFieldDidBeginEditing(_ textField: TextField)
    @objc optional func textFieldDidEndEditing(_ textField: TextField)
    @objc optional func textFieldShouldBeginEditing(_ textField: TextField) -> Bool
    @objc optional func textField(_ textField: TextField, changeCharInRange: NSRange, string: String) -> Bool
}
