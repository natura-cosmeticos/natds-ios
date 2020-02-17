public enum TextFieldType {
    case text
    case number

    var keyboard: UIKeyboardType {
        switch self {
        case .text:
            return .default
        case .number:
            return .numberPad
        }
    }

    var autoCorrection: UITextAutocorrectionType {
        switch self {
        case .text:
            return .yes
        case .number:
            return .no
        }
    }

    var capitalization: UITextAutocapitalizationType {
         switch self {
         case .text:
             return .none
         case .number:
             return .none
         }
     }
}
