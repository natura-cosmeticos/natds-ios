enum ShortcutContainedStyle {
    static func apply(on shortcut: NatShortcut) {
        let backgroundColor = shortcut.color.containedBackgroundColor(state: shortcut.state)
        let iconColor = shortcut.color.containedIconColor(state: shortcut.state)
        let borderColor = shortcut.color.containedBorderColor(state: shortcut.state)
        let labelColor = shortcut.color.containedLabelColor(state: shortcut.state)
        let elevation = NatElevation.ElevationAttributes.tiny

        shortcut.configure(circleColor: backgroundColor)
        shortcut.configure(iconColor: iconColor)
        shortcut.configure(labelColor: labelColor)
        shortcut.configure(circleBorderWidth: 0)
        shortcut.configure(circleBorderColor: borderColor.cgColor)
        shortcut.configure(elevation: elevation)
    }
}
