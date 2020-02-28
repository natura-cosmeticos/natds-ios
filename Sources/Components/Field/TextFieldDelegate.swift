@objc public protocol TextFieldDelegate: AnyObject {

    @objc optional func natTextFieldDidBeginEditing(_ textField: TextField)
    @objc optional func natTextFieldDidEndEditing(_ textField: TextField)
    @objc optional func natTextFieldEditingChanged(_ textField: TextField)
    @objc optional func natTextFieldShouldBeginEditing(_ textField: TextField) -> Bool
    @objc optional func natTextField(_ textField: TextField, changeCharInRange: NSRange, string: String) -> Bool
}
