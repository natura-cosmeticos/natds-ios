extension NatAlert {
    public enum AlertStyle {
        case success, error, warning, info
        case custom(backgroundColor: UIColor, borderColor: UIColor, labelsColor: UIColor)
        
        var selectedBackgroundColor: UIColor {
            //valores hardcoded enquanto não é feito update de tokens, com as cores novas.
            switch self {
            case .success:
                return UIColor(red: 211/255, green: 249/255, blue: 216/255, alpha: 1)
            case .error:
                return UIColor(red: 255/255, green: 227/255, blue: 227/255, alpha: 1)
            case .warning:
                return UIColor(red: 255/255, green: 243/255, blue: 191/255, alpha: 1)
            case .info:
                return UIColor(red: 208/255, green: 235/255, blue: 255/255, alpha: 1)
            case .custom(let color, _, _):
                return color
            }
        }

        var selectedLabelColor: UIColor {
            switch self {
            case .success, .error, .warning, .info:
                return UIColor.black
            case .custom(_, _, let color):
                return color
            }
        }

        var selectedBorderColor: UIColor {
            switch self {
            case .success:
                return NatColors.success
            case .error:
                return NatColors.alert
            case .warning:
                return NatColors.warning
            case .info:
                return NatColors.link
            case .custom(_, let color, _):
                return color
            }
        }
    }
    
    public enum AlertType {
        case contained, outlined
    }
    
}
