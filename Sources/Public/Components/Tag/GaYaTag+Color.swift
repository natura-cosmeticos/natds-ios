//
//  GaYaTag+Color.swift
//  GaYaDS
//
//  Created by Hayna.Cardoso on 12/11/24.
//  Copyright © 2024 Natura. All rights reserved.
//

extension GaYaTag {
    
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
                if theme == .none {
                    return getUIColorFromTokens(\.colorPrimaryLightest)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimaryLightest)
                }
            case .primaryDarkest:
                if theme == .none {
                    return getUIColorFromTokens(\.colorPrimaryDarkest)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorPrimaryDarkest)
                }
            case .secondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSecondary)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondary)
                }
            case .secondaryLightest:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSecondaryLightest)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondaryLightest)
                }
            case .secondaryDarkest:
                if theme == .none {
                    return getUIColorFromTokens(\.colorSecondaryDarkest)
                } else {
                    return hexStringToUIColor(hex: theme.newInstance.tokens.colorSecondaryDarkest)
                }
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
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnPrimaryLightest)
                } else {
                    return hexStringToUIColor(hex:theme.newInstance.tokens.colorOnPrimaryLightest)
                }
            case .primaryDarkest:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnPrimaryDarkest)
                } else {
                    return hexStringToUIColor(hex:theme.newInstance.tokens.colorOnPrimaryDarkest)
                }
            case .secondary:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnSecondary)
                } else {
                    return hexStringToUIColor(hex:theme.newInstance.tokens.colorOnSecondary)
                }
            case .secondaryLightest:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnSecondaryLightest)
                } else {
                    return hexStringToUIColor(hex:theme.newInstance.tokens.colorOnSecondaryLightest)
                }
            case .secondaryDarkest:
                if theme == .none {
                    return getUIColorFromTokens(\.colorOnSecondaryDarkest)
                } else {
                    return hexStringToUIColor(hex:theme.newInstance.tokens.colorOnSecondaryDarkest)
                }
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
