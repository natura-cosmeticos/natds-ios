public enum TextFieldType {
    case text
    case name
    case number
    case password(keyboardType: UIKeyboardType = .default)

    var keyboard: UIKeyboardType {
        switch self {
        case .text:
            return .default
        case .name:
            return .default
        case .number:
            return .numberPad
        case let .password(type):
            return type
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
        case .password:
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
         case .password:
            return .none
         }
     }

    var secureTextEntry: Bool {
        switch self {
        case .text:
            return false
        case .name:
            return false
        case .number:
            return false
        case .password:
            return true
        }
    }

    var showVisibilityIcon: Bool {
        switch self {
        case .text:
            return false
        case .name:
            return false
        case .number:
            return false
        case .password:
            return true
        }
    }
}
