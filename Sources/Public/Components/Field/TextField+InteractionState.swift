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

        var borderColor: UIColor {
            switch self {
            case .enabled,
                 .readOnly,
                 .disabled:
                return getUIColorFromTokens(\.colorLowEmphasis)
            case .active:
                return getUIColorFromTokens(\.colorPrimary)
            case .filled:
                return getUIColorFromTokens(\.colorHighEmphasis)
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

        var textFieldTintColor: UIColor {
            return getUIColorFromTokens(\.colorPrimary)
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
}
