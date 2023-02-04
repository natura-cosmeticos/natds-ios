extension NatSnackbar {
    /**
     Feedback is a enum that represents the background color style of the NatSnackbar component.

        These are the types of feedback:
        - default (color high emphasis)
        - success (color success)
        - error (color alert)
        - \warning (color warning)
        - info (color link)
     
     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */

    public enum Feedback {
        case `default`
        case success
        case error
        case warning
        case info

        var color: UIColor {
            switch self {
            case .default:
                return NatColors.highEmphasis
            case .success:
                return NatColors.success
            case .error:
                return NatColors.alert
            case .warning:
                return NatColors.warning
            case .info:
                return NatColors.link
            }
        }

        var textColor: UIColor {
            switch self {
            case .default:
                return NatColors.onSuccess
            case .success:
                return NatColors.onSuccess
            case .error:
                return NatColors.onAlert
            case .warning:
                return NatColors.onWarning
            case .info:
                return NatColors.onLink
            }
        }
    }
}
