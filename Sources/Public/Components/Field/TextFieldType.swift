// swiftlint:disable line_length
/**
 TextFieldType is an enum that represents the possible types for a TextField.
 The chosen type indicates what kind of content will be received from the textField, and adjusts keyboard, autocorrection, capitalization and security for the textField input.
 
 These are all types allowed for a TextField:
 - text
 - number
 - name
 - password
 */
public enum TextFieldType {
    case text
    case name
    case number
    case password(keyboardType: UIKeyboardType = .default)

    var keyboard: UIKeyboardType {
        switch self {
        case .text,
             .name:
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
        default:
            return .no
        }
    }

    var capitalization: UITextAutocapitalizationType {
         switch self {
         case .name:
            return .words
         default:
            return .none
         }
     }

    var secureTextEntry: Bool {
        switch self {
        case .password:
            return true
        default:
            return false
        }
    }
}
