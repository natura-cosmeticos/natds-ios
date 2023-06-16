enum ShortcutContainedStyle {
    static func apply(_ theme:AvailableTheme, on shortcut: NatShortcut) {
        apply(theme, on: shortcut, color: shortcut.color)
    }

    static func apply(_ theme:AvailableTheme, on shortcut: NatShortcut, color: NatShortcut.Color) {
        let backgroundColor = color.containedBackgroundColor(theme: theme, state: shortcut.state)
        let iconColor = color.containedIconColor(theme: theme, state: shortcut.state)
        let borderColor = color.containedBorderColor(theme: theme, state: shortcut.state)
        let labelColor = color.containedLabelColor(theme: theme, state: shortcut.state)
        let elevation = NatElevation.ElevationAttributes.tiny

        shortcut.configure(circleColor: backgroundColor)
        shortcut.configure(iconColor: iconColor)
        shortcut.configure(labelColor: labelColor)
        shortcut.configure(circleBorderWidth: 0)
        shortcut.configure(circleBorderColor: borderColor.cgColor)
        shortcut.configure(elevation: elevation)
    }

    static func applyPrimaryStyle(_ theme:AvailableTheme, on shortcut: NatShortcut) {
        apply(theme, on: shortcut, color: .primary)
    }

    static func applyDefaultStyle(_ theme:AvailableTheme, on shortcut: NatShortcut) {
        apply(theme, on: shortcut, color: .neutral)
    }
}
