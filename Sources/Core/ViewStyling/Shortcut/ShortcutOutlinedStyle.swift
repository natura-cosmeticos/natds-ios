enum ShortcutOutlinedStyle {
    static func apply(on shortcut: NatShortcut) {
        apply(on: shortcut, color: shortcut.color)
    }

    static func apply(on shortcut: NatShortcut, color: NatShortcut.Color) {
        let backgroundColor = color.outlinedBackgroundColor(state: shortcut.state)
        let iconColor = color.outlinedIconColor(state: shortcut.state)
        let borderColor = color.outlinedBorderColor(state: shortcut.state)
        let labelColor = color.outlinedLabelColor(state: shortcut.state)
        let elevation = NatElevation.ElevationAttributes.none

        shortcut.configure(circleColor: backgroundColor)
        shortcut.configure(iconColor: iconColor)
        shortcut.configure(labelColor: labelColor)
        shortcut.configure(circleBorderWidth: 1)
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
