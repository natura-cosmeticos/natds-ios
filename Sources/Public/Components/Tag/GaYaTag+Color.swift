extension GaYaTag {
    /**
     Size is an enum that represents the possible colors for the GaYaTag.
     The default color is `Primary`.
     
     These are all colors allowed for a GaYaTag:
     - primary
     - primaryLightest
     - primaryDarkest
     - secondary
     - secondaryLightest
     - secondaryDarkest
     - success
     - successLightest
     - successDarkest
     - alert
     - alertLightest
     - alertDarkest
     - `warning`
     - `warningLightest`
     - `warningDarkest`
     - info
     - infoLightest
     - infoDarkest
     */
    
    public enum Color {
        case primary
        case primaryLightest
        case primaryDarkest
        case secondary
        case secondaryLightest
        case secondaryDarkest
        case success
        case successLightest
        case successDarkest
        case alert
        case alertLightest
        case alertDarkest
        case warning
        case warningLightest
        case warningDarkest
        case info
        case infoLightest
        case infoDarkest
        
        var tag: UIColor {
            switch self {
            case .primary:
                return getUIColorFromTokens(\.colorPrimary)
            case .primaryLightest:
                return getUIColorFromTokens(\.colorPrimaryLightest)
            case .primaryDarkest:
                return getUIColorFromTokens(\.colorPrimaryDarkest)
            case .secondary:
                return getUIColorFromTokens(\.colorSecondary)
            case .secondaryLightest:
                return getUIColorFromTokens(\.colorSecondaryLightest)
            case .secondaryDarkest:
                return getUIColorFromTokens(\.colorSecondaryDarkest)
            case .success:
                return getUIColorFromTokens(\.colorSuccess)
            case .successLightest:
                return getUIColorFromTokens(\.colorSuccessLightest)
            case .successDarkest:
                return getUIColorFromTokens(\.colorSuccessDarkest)
            case .alert:
                return getUIColorFromTokens(\.colorAlert)
            case .alertLightest:
                return getUIColorFromTokens(\.colorAlertLightest)
            case .alertDarkest:
                return getUIColorFromTokens(\.colorAlertDarkest)
            case .warning:
                return getUIColorFromTokens(\.colorWarning)
            case .warningLightest:
                return getUIColorFromTokens(\.colorWarningLightest)
            case .warningDarkest:
                return getUIColorFromTokens(\.colorWarningDarkest)
            case .info:
                return getUIColorFromTokens(\.colorInfo)
            case .infoLightest:
                return getUIColorFromTokens(\.colorInfoLightest)
            case .infoDarkest:
                return getUIColorFromTokens(\.colorInfoDarkest)
            }
        }
        
        var label: UIColor {
            switch self {
            case .primary:
                return getUIColorFromTokens(\.colorOnPrimary)
            case .primaryLightest:
                return getUIColorFromTokens(\.colorOnPrimaryLightest)
            case .primaryDarkest:
                return getUIColorFromTokens(\.colorOnPrimaryDarkest)
            case .secondary:
                return getUIColorFromTokens(\.colorOnSecondary)
            case .secondaryLightest:
                return getUIColorFromTokens(\.colorOnSecondaryLightest)
            case .secondaryDarkest:
                return getUIColorFromTokens(\.colorOnSecondaryDarkest)
            case .success:
                return getUIColorFromTokens(\.colorOnSuccess)
            case .successLightest:
                return getUIColorFromTokens(\.colorOnSuccessLightest)
            case .successDarkest:
                return getUIColorFromTokens(\.colorOnSuccessDarkest)
            case .alert:
                return getUIColorFromTokens(\.colorOnAlert)
            case .alertLightest:
                return getUIColorFromTokens(\.colorOnAlertLightest)
            case .alertDarkest:
                return getUIColorFromTokens(\.colorOnAlertDarkest)
            case .warning:
                return getUIColorFromTokens(\.colorOnWarning)
            case .warningLightest:
                return getUIColorFromTokens(\.colorOnWarningLightest)
            case .warningDarkest:
                return getUIColorFromTokens(\.colorOnWarningDarkest)
            case .info:
                return getUIColorFromTokens(\.colorOnInfo)
            case .infoLightest:
                return getUIColorFromTokens(\.colorOnInfoLightest)
            case .infoDarkest:
                return getUIColorFromTokens(\.colorOnInfoDarkest)
            }
        }
    }
        
        
    public struct ThemeColor {
        private let theme: AvailableTheme
        private let colorType: Color
            
            
        public init(theme: AvailableTheme, colorType: Color) {
            self.theme = theme
            self.colorType = colorType
        }
            
        public var tag: UIColor {
            switch colorType {
            case .primary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorPrimary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimary)
                }
            case .primaryLightest:
                return getUIColorFromTokens(\.colorPrimaryLightest)
            case .primaryDarkest:
                return getUIColorFromTokens(\.colorPrimaryDarkest)
            case .secondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSecondary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary)
                }
            case .secondaryLightest:
                return getUIColorFromTokens(\.colorSecondaryLightest)
            case .secondaryDarkest:
                return getUIColorFromTokens(\.colorSecondaryDarkest)
            case .success:
                return getUIColorFromTokens(\.colorSuccess)
            case .successLightest:
                return getUIColorFromTokens(\.colorSuccessLightest)
            case .successDarkest:
                return getUIColorFromTokens(\.colorSuccessDarkest)
            case .alert:
                return getUIColorFromTokens(\.colorAlert)
            case .alertLightest:
                return getUIColorFromTokens(\.colorAlertLightest)
            case .alertDarkest:
                return getUIColorFromTokens(\.colorAlertDarkest)
            case .warning:
                return getUIColorFromTokens(\.colorWarning)
            case .warningLightest:
                return getUIColorFromTokens(\.colorWarningLightest)
            case .warningDarkest:
                return getUIColorFromTokens(\.colorWarningDarkest)
            case .info:
                return getUIColorFromTokens(\.colorInfo)
            case .infoLightest:
                return getUIColorFromTokens(\.colorInfoLightest)
            case .infoDarkest:
                return getUIColorFromTokens(\.colorInfoDarkest)
            }
        }
        
        public var label: UIColor {
            switch colorType {
            case .primary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnPrimary)
                } else {
                    return hexStringToUIColor(hex:theme.newInstance.tokens.colorOnPrimary)
                }
            case .primaryLightest:
                return getUIColorFromTokens(\.colorOnPrimaryLightest)
            case .primaryDarkest:
                return getUIColorFromTokens(\.colorOnPrimaryDarkest)
            case .secondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnSecondary)
                } else {
                    return hexStringToUIColor(hex:theme.newInstance.tokens.colorOnSecondary)
                }
            case .secondaryLightest:
                return getUIColorFromTokens(\.colorOnSecondaryLightest)
            case .secondaryDarkest:
                return getUIColorFromTokens(\.colorOnSecondaryDarkest)
            case .success:
                return getUIColorFromTokens(\.colorOnSuccess)
            case .successLightest:
                return getUIColorFromTokens(\.colorOnSuccessLightest)
            case .successDarkest:
                return getUIColorFromTokens(\.colorOnSuccessDarkest)
            case .alert:
                return getUIColorFromTokens(\.colorOnAlert)
            case .alertLightest:
                return getUIColorFromTokens(\.colorOnAlertLightest)
            case .alertDarkest:
                return getUIColorFromTokens(\.colorOnAlertDarkest)
            case .warning:
                return getUIColorFromTokens(\.colorOnWarning)
            case .warningLightest:
                return getUIColorFromTokens(\.colorOnWarningLightest)
            case .warningDarkest:
                return getUIColorFromTokens(\.colorOnWarningDarkest)
            case .info:
                return getUIColorFromTokens(\.colorOnInfo)
            case .infoLightest:
                return getUIColorFromTokens(\.colorOnInfoLightest)
            case .infoDarkest:
                return getUIColorFromTokens(\.colorOnInfoDarkest)
            }
        }
    }
}
