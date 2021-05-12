extension TextField {
    /**
     FeedbackState is an enum that represents the possible states for a TextField.
     The chosen state indicates the type of feedback should be displayed, and sets the style for the textField.
     The `error` and `success` states also display an icon with the corresponding color and image.
     The `none` state clears the textField if they're already configured with another state.
     
     These are all states allowed for a TextField:
     - error
     - success
     - none
     */
    public enum FeedbackState {
        case error
        case success
        case none
        
        var borderWidth: CGFloat {
            switch self {
            case .error:
                return 2
            default:
                return 1
            }
        }

        var tintColor: UIColor {
            switch self {
            case .error:
                return getUIColorFromTokens(\.colorAlert)
            case .success:
                return getUIColorFromTokens(\.colorSuccess)
            default:
                return .clear
            }
        }

        var helperIcon: UIImage? {
            switch self {
            case .error:
                return AssetsPath.iconOutlinedActionCancel.rawValue
            case .success:
                return AssetsPath.iconOutlinedActionCheck.rawValue
            default:
                return nil
            }
        }
    }
}
