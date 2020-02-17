public enum TextFieldType {
    case text
    case name
    case number

    var keyboard: UIKeyboardType {
        switch self {
        case .text:
            return .default
        case .name:
            return .default
        case .number:
            return .numberPad
        }
    }

    var autoCorrection: UITextAutocorrectionType {
        switch self {
        case .text:
            return .yes
        case .name:
            return .no
        case .number:
            return .no
        }
    }

    var capitalization: UITextAutocapitalizationType {
         switch self {
         case .text:
             return .none
         case .name:
            return .words
         case .number:
             return .none
         }
     }
}
