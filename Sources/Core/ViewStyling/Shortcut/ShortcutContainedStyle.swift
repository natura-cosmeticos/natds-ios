enum ShortcutContainedStyle {
    static func apply(on shortcut: NatShortcut) {
        apply(on: shortcut, color: shortcut.color)
    }

    static func apply(on shortcut: NatShortcut, color: NatShortcut.Color) {
        let backgroundColor = color.containedBackgroundColor(state: shortcut.state)
        let iconColor = color.containedIconColor(state: shortcut.state)
        let borderColor = color.containedBorderColor(state: shortcut.state)
        let labelColor = color.containedLabelColor(state: shortcut.state)
        let elevation = NatElevation.ElevationAttributes.tiny

        shortcut.configure(circleColor: backgroundColor)
        shortcut.configure(iconColor: iconColor)
        shortcut.configure(labelColor: labelColor)
        shortcut.configure(circleBorderWidth: 0)
        shortcut.configure(circleBorderColor: borderColor.cgColor)
        shortcut.configure(elevation: elevation)
    }

    static func applyPrimaryStyle(on shortcut: NatShortcut) {
        apply(on: shortcut, color: .primary)
    }

    static func applyDefaultStyle(on shortcut: NatShortcut) {
        apply(on: shortcut, color: .neutral)
    }
}
