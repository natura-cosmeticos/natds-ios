// swiftlint:disable line_length
extension NatShortcut {
    /// `Style` applies the variant style for `shortcut`
    public struct Style {
        let applyStyle: (NatShortcut) -> Void
    }

    /// `Color` represents the possible colors for `shortcut`
    public enum Color {
        case primary
        case neutral

        // MARK: Outlined attributes

        func outlinedBackgroundColor(state: NatShortcut.State) -> UIColor {
            switch self {
            case .primary:
                return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnablePrimaryBackground) :
                    getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisablePrimaryBackground)
            case .neutral:
                return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnableNeutralBackground) :
                    getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisableNeutralBackground)
            }
        }

        func outlinedBorderColor(state: NatShortcut.State) -> UIColor {
            switch self {
            case .primary:
                return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnablePrimaryBorder) :
                    getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisablePrimaryBorder)
            case .neutral:
                return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnableNeutralBorder) :
                    getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisableNeutralBorder)
            }
        }

        func outlinedIconColor(state: NatShortcut.State) -> UIColor {
            switch self {
            case .primary:
                return state == .enabled ? getUIColorFromTokens(\.colorHighEmphasis) : getUIColorFromTokens(\.colorLowEmphasis)
            case .neutral:
                return state == .enabled ? getUIColorFromTokens(\.colorHighEmphasis) : getUIColorFromTokens(\.colorLowEmphasis)
            }
        }

        func outlinedLabelColor(state: NatShortcut.State) -> UIColor {
            switch self {
            case .primary:
                return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnablePrimaryLabel) : getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisablePrimaryLabel)
            case .neutral:
                return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnableNeutralLabel) : getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisableNeutralLabel)
            }
        }

        // MARK: Contained attributes

        func containedBackgroundColor(state: NatShortcut.State) -> UIColor {
            switch self {
            case .primary:
                return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutContainedColorEnablePrimaryBackground) :
                    getUIColorFromComponentAttributes(\.shortcutContainedColorDisablePrimaryBackground)
            case .neutral:
                return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutContainedColorEnableNeutralBackground) :
                    getUIColorFromComponentAttributes(\.shortcutContainedColorDisableNeutralBackground)
            }
        }

        func containedBorderColor(state: NatShortcut.State) -> UIColor {
            switch self {
            case .primary:
                return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutContainedColorEnablePrimaryBorder) :
                    getUIColorFromComponentAttributes(\.shortcutContainedColorDisablePrimaryBorder)
            case .neutral:
                return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutContainedColorEnableNeutralBorder) :
                    getUIColorFromComponentAttributes(\.shortcutContainedColorDisableNeutralBorder)
            }
        }

        func containedIconColor(state: NatShortcut.State) -> UIColor {
            switch self {
            case .primary:
                return state == .enabled ? getUIColorFromTokens(\.colorOnPrimary) : getUIColorFromTokens(\.colorMediumEmphasis)
            case .neutral:
                return state == .enabled ? getUIColorFromTokens(\.colorHighEmphasis) : getUIColorFromTokens(\.colorMediumEmphasis)
            }
        }

        func containedLabelColor(state: NatShortcut.State) -> UIColor {
            switch self {
            case .primary:
                return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutContainedColorEnablePrimaryLabel) : getUIColorFromComponentAttributes(\.shortcutContainedColorDisablePrimaryLabel)
            case .neutral:
                return state == .enabled ? getUIColorFromComponentAttributes(\.shortcutContainedColorEnableNeutralLabel) : getUIColorFromComponentAttributes(\.shortcutContainedColorDisableNeutralLabel)
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
