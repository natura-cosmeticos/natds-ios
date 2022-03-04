extension NatShortcut {
    /**
     Style represents styles values for the NatShortcut component.
    */
    public struct Style {
        let applyStyle: (NatShortcut) -> Void
    }

    public enum Color {
        case primary
        case neutral

        var enabledContainedBackgroundColor: UIColor {
            switch self {
            case .primary:
                return getUIColorFromTokens(\.colorPrimary)
            default:
                return getUIColorFromTokens(\.colorSurface)
            }
        }

        var disabledContainedBackgroundColor: UIColor {
            return getUIColorFromTokens(\.colorLowEmphasis)
        }

        var enabledOutlinedBackgroundColor: UIColor {
            return UIColor.clear
        }

        var disabledOutlinedBackgroundColor: UIColor {
            return getUIColorFromTokens(\.colorSurface)
        }

        var enabledOutlinedBorderColor: UIColor {
            switch self {
            case .primary:
                return getUIColorFromTokens(\.colorPrimary)
            default:
                return getUIColorFromTokens(\.colorLowEmphasis)
            }
        }

        var disabledOutlinedBorderColor: UIColor {
            return getUIColorFromTokens(\.colorLowEmphasis)
        }

        var enabledIconColor: UIColor {
            return getUIColorFromTokens(\.colorHighEmphasis)
        }

        var disabledIconColor: UIColor {
            switch self {
            case .primary:
                return getUIColorFromTokens(\.colorMediumEmphasis)
            default:
                return getUIColorFromTokens(\.colorLowEmphasis)
            }
        }

        var enabledLabelColor: UIColor {
            return getUIColorFromTokens(\.colorHighEmphasis)
        }

        var disabledLabelColor: UIColor {
            switch self {
            case .primary:
                return getUIColorFromTokens(\.colorMediumEmphasis)
            default:
                return getUIColorFromTokens(\.colorLowEmphasis)
            }
        }
    }
}

extension NatShortcut.Style {
    public static var contained: NatShortcut.Style {
        .init(applyStyle: ShortcutContainedStyle.apply)
    }

    public static var outlined: NatShortcut.Style {
        .init(applyStyle: ShortcutOutlinedStyle.apply)
    }
}

//extension NatShortcut.Style {
//    @available(*, deprecated, message: "Use a combination of Color and Style")
//    public static var containedPrimary: NatShortcut.Style {
//        .init(
//            applyStyle: ShortcutContainedStyle.applyPrimaryStyle
//        )
//    }
//
//    @available(*, deprecated, message: "Use a combination of Color and Style")
//    public static var containedDefault: NatShortcut.Style {
//        .init(
//            applyStyle: ShortcutContainedStyle.applyDefaultStyle
//        )
//    }
//
//    @available(*, deprecated, message: "Use a combination of Color and Style")
//    public static var outlinedPrimary: NatShortcut.Style {
//        .init(
//            applyStyle: ShortcutOutlinedStyle.applyPrimaryStyle
//        )
//    }
//
//    @available(*, deprecated, message: "Use a combination of Color and Style")
//    public static var outlinedDefault: NatShortcut.Style {
//        .init(
//            applyStyle: ShortcutOutlinedStyle.applyDefaultStyle
//        )
//    }
//}
