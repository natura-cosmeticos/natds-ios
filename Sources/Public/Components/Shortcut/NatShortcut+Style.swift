// swiftlint:disable line_length
extension NatShortcut {
    /// `Style` applies the variant style for `shortcut`
    public struct Style {
        let applyStyle: (AvailableTheme, NatShortcut) -> Void
    }

    /// `Color` represents the possible colors for `shortcut`
    public enum Color {
        case primary
        case neutral 

        // MARK: Outlined attributes

        func outlinedBackgroundColor(theme: AvailableTheme = .none, state: NatShortcut.State) -> UIColor {
            
            
                switch self {
                case .primary:
                    return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnablePrimaryBackground) :
                        getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisablePrimaryBackground)
                case .neutral:
                    return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnableNeutralBackground) :
                        getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisableNeutralBackground)
                }
            
        }

        func outlinedBorderColor(theme: AvailableTheme = .none, state: NatShortcut.State) -> UIColor {
            
            if theme == .none {
                switch self {
                case .primary:
                    return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnablePrimaryBorder) :
                        getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisablePrimaryBorder)
                case .neutral:
                    return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnableNeutralBorder) :
                        getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisableNeutralBorder)
                }
            }
            else {
                switch self {
                case .primary:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.components.shortcutOutlinedColorEnablePrimaryBorder) :
                    hexStringToUIColor(hex: theme.newInstance.components.shortcutOutlinedColorDisablePrimaryBorder)
                case .neutral:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.components.shortcutOutlinedColorEnableNeutralBorder) :
                    hexStringToUIColor(hex: theme.newInstance.components.shortcutOutlinedColorDisableNeutralBorder)
                }
            }
        }

        func outlinedIconColor(theme: AvailableTheme = .none, state: NatShortcut.State) -> UIColor {
            
            if theme == .none {
                switch self {
                case .primary:
                    return state == .enabled ? getUIColorFromTokens(\.colorHighEmphasis) : getUIColorFromTokens(\.colorLowEmphasis)
                case .neutral:
                    return state == .enabled ? getUIColorFromTokens(\.colorHighEmphasis) : getUIColorFromTokens(\.colorLowEmphasis)
                }
            }
            else {
                switch self {
                case .primary:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.tokens.colorHighEmphasis) : hexStringToUIColor(hex: theme.newInstance.tokens.colorLowEmphasis)
                case .neutral:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.tokens.colorHighEmphasis) : hexStringToUIColor(hex: theme.newInstance.tokens.colorLowEmphasis)
                }
            }
        }

        func outlinedLabelColor(theme: AvailableTheme = .none, state: NatShortcut.State) -> UIColor {
            
            if theme == .none {
                switch self {
                case .primary:
                    return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnablePrimaryLabel) : getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisablePrimaryLabel)
                case .neutral:
                    return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnableNeutralLabel) : getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisableNeutralLabel)
                }
            }
            else {
                switch self {
                case .primary:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.components.shortcutOutlinedColorEnablePrimaryLabel) : hexStringToUIColor(hex: theme.newInstance.components.shortcutOutlinedColorDisablePrimaryLabel)
                case .neutral:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.components.shortcutOutlinedColorEnableNeutralLabel) : hexStringToUIColor(hex: theme.newInstance.components.shortcutOutlinedColorDisableNeutralLabel)
                }
            }
        }

        // MARK: Contained attributes

        func containedBackgroundColor(theme: AvailableTheme = .none, state: NatShortcut.State) -> UIColor {
            
            if theme == .none {
                switch self {
                case .primary:
                    return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutContainedColorEnablePrimaryBackground) :
                        getUIColorFromComponentAttributes(\.shortcutContainedColorDisablePrimaryBackground)
                case .neutral:
                    return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutContainedColorEnableNeutralBackground) :
                        getUIColorFromComponentAttributes(\.shortcutContainedColorDisableNeutralBackground)
                }
            }
            else {
                switch self {
                case .primary:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.components.shortcutContainedColorEnablePrimaryBackground) :
                    hexStringToUIColor(hex: theme.newInstance.components.shortcutContainedColorDisablePrimaryBackground)
                case .neutral:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.components.shortcutContainedColorEnableNeutralBackground) :
                    hexStringToUIColor(hex: theme.newInstance.components.shortcutContainedColorDisableNeutralBackground)
                }
            }
        }

        func containedBorderColor(theme: AvailableTheme = .none, state: NatShortcut.State) -> UIColor {
            
            if theme == .none {
                switch self {
                case .primary:
                    return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutContainedColorEnablePrimaryBorder) :
                        getUIColorFromComponentAttributes(\.shortcutContainedColorDisablePrimaryBorder)
                case .neutral:
                    return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutContainedColorEnableNeutralBorder) :
                        getUIColorFromComponentAttributes(\.shortcutContainedColorDisableNeutralBorder)
                }
            }
            else {
                switch self {
                case .primary:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.components.shortcutContainedColorEnablePrimaryBorder) :
                    hexStringToUIColor(hex: theme.newInstance.components.shortcutContainedColorDisablePrimaryBorder)
                case .neutral:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.components.shortcutContainedColorEnableNeutralBorder) :
                    hexStringToUIColor(hex: theme.newInstance.components.shortcutContainedColorDisableNeutralBorder)
                }
            }
        }

        func containedIconColor(theme: AvailableTheme = .none, state: NatShortcut.State) -> UIColor {
            
            if theme == .none {
                switch self {
                case .primary:
                    return state == .enabled ? getUIColorFromTokens(\.colorOnPrimary) : getUIColorFromTokens(\.colorMediumEmphasis)
                case .neutral:
                    return state == .enabled ? getUIColorFromTokens(\.colorHighEmphasis) : getUIColorFromTokens(\.colorMediumEmphasis)
                }
            }
            else {
                switch self {
                case .primary:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.tokens.colorOnPrimary) : hexStringToUIColor(hex: theme.newInstance.tokens.colorMediumEmphasis)
                case .neutral:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.tokens.colorHighEmphasis) : hexStringToUIColor(hex: theme.newInstance.tokens.colorMediumEmphasis)
                }
            }
        }

        func containedLabelColor(theme: AvailableTheme = .none, state: NatShortcut.State) -> UIColor {
            
            if theme == .none {
                switch self {
                case .primary:
                    return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutContainedColorEnablePrimaryLabel) : getUIColorFromComponentAttributes(\.shortcutContainedColorDisablePrimaryLabel)
                case .neutral:
                    return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutContainedColorEnableNeutralLabel) : getUIColorFromComponentAttributes(\.shortcutContainedColorDisableNeutralLabel)
                }
            }
            else {
                switch self {
                case .primary:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.components.shortcutContainedColorEnablePrimaryLabel) : hexStringToUIColor(hex: theme.newInstance.components.shortcutContainedColorDisablePrimaryLabel)
                case .neutral:
                    return state == .enabled ? hexStringToUIColor(hex: theme.newInstance.components.shortcutContainedColorEnableNeutralLabel) : hexStringToUIColor(hex: theme.newInstance.components.shortcutContainedColorDisableNeutralLabel)
                }
            }
        }
    }
}

extension NatShortcut.Style {
    /// Represents a `shortcut` variant
    public static var contained: NatShortcut.Style {
        .init(applyStyle: ShortcutContainedStyle.apply)
    }

    /// Represents a `shortcut` variant
    public static var outlined: NatShortcut.Style {
        .init(applyStyle: ShortcutOutlinedStyle.apply)
    }
}

 extension NatShortcut.Style {
    @available(*, deprecated, message: "Use contained style and primary color")
    public static var containedPrimary: NatShortcut.Style {
        .init(applyStyle: ShortcutContainedStyle.applyPrimaryStyle)
    }

    @available(*, deprecated, message: "Use contained style and neutral color")
    public static var containedDefault: NatShortcut.Style {
        .init(
            applyStyle: ShortcutContainedStyle.applyDefaultStyle)
    }

    @available(*, deprecated, message: "Use outlined style and primary color")
    public static var outlinedPrimary: NatShortcut.Style {
        .init(
            applyStyle: ShortcutOutlinedStyle.applyPrimaryStyle)
    }

    @available(*, deprecated, message: "Use outlined style and primary color")
    public static var outlinedDefault: NatShortcut.Style {
        .init(
            applyStyle: ShortcutOutlinedStyle.applyDefaultStyle)
    }
 }
