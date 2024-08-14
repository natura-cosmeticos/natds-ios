extension TextField {
    
    public enum InteractionState: CaseIterable {
        case enabled
        case disabled
        case readOnly
        case active
        case filled

        var isUserInteractionEnabled: Bool {
            switch self {
            case .disabled,
                 .readOnly:
                return false
            default:
                return true
            }
        }

        var borderWidth: CGFloat {
            switch self {
            case .active:
                return 2
            default:
                return 1
            }
        }

        var textColor: UIColor {
            switch self {
            case .enabled:
                return getUIColorFromTokens(\.colorHighEmphasis)
            case .readOnly:
                return getUIColorFromTokens(\.colorHighEmphasis)
            case .disabled:
                return getUIColorFromTokens(\.colorLowEmphasis)
            case .active:
                return getUIColorFromTokens(\.colorHighEmphasis)
            case .filled:
                return getUIColorFromTokens(\.colorHighEmphasis)
            }
        }

        var titleTextColor: UIColor {
            switch self {
            case .enabled:
                return getUIColorFromTokens(\.colorMediumEmphasis)
            case .readOnly:
                return getUIColorFromTokens(\.colorMediumEmphasis)
            case .disabled:
                return getUIColorFromTokens(\.colorLowEmphasis)
            case .active:
                return getUIColorFromTokens(\.colorMediumEmphasis)
            case .filled:
                return getUIColorFromTokens(\.colorMediumEmphasis)
            }
        }

        var helperLabelTextColor: UIColor {
            switch self {
            case .enabled:
                return getUIColorFromTokens(\.colorMediumEmphasis)
            case .readOnly:
                return getUIColorFromTokens(\.colorMediumEmphasis)
            case .disabled:
                return getUIColorFromTokens(\.colorLowEmphasis)
            case .active:
                return getUIColorFromTokens(\.colorMediumEmphasis)
            case .filled:
                return getUIColorFromTokens(\.colorMediumEmphasis)
            }
        }

        var textFieldBackgroundColor: UIColor {
            switch self {
            case .readOnly:
                return getUIColorFromTokens(\.colorLowEmphasis).withAlphaComponent(0.25)
            default:
                return .clear
            }
        }

        var iconColor: UIColor {
            switch self {
            case .enabled:
                return getUIColorFromTokens(\.colorHighlight)
            case .readOnly:
                return getUIColorFromTokens(\.colorHighEmphasis)
            case .disabled:
                return getUIColorFromTokens(\.colorLowEmphasis)
            case .active:
                return getUIColorFromTokens(\.colorHighlight)
            case .filled:
                return getUIColorFromTokens(\.colorHighEmphasis)
            }
        }

        var placeholderTextColor: UIColor {
            switch self {
            case .enabled,
                 .active,
                 .readOnly:
                return getUIColorFromTokens(\.colorMediumEmphasis)
            default:
                return getUIColorFromTokens(\.colorLowEmphasis)
            }
        }
    }
    
    public struct ThemeColor {
        private let theme: AvailableTheme
        private let state: InteractionState


        public init(theme: AvailableTheme, state: InteractionState) {
            self.theme = theme
            self.state = state
        }

        public var borderColor: UIColor
        {
            switch state {
            case .enabled,
                 .readOnly,
                 .disabled:
                return getUIColorFromTokens(\.colorLowEmphasis)
            case .active:
                if (theme == .none){
                    return getUIColorFromComponentAttributes(\.colorInputComponent)
                }
                else {
                    return hexStringToUIColor(hex: theme.newInstance.components.colorInputComponent)
                }
            case .filled:
                return getUIColorFromTokens(\.colorHighEmphasis)
            }
        }
        
        public var textFieldTintColor: UIColor {
            if (theme == .none){
                return getUIColorFromComponentAttributes(\.colorInputComponent)
            }
            else {
                return hexStringToUIColor(hex: theme.newInstance.components.colorInputComponent)
            }
        }
    }
}
