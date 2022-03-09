enum ShortcutOutlinedStyle {
    static func apply(on shortcut: NatShortcut) {
        let backgroundColor = shortcut.color.outlinedBackgroundColor(state: shortcut.state)
        let iconColor = shortcut.color.outlinedIconColor(state: shortcut.state)
        let borderColor = shortcut.color.outlinedBorderColor(state: shortcut.state)
        let labelColor = shortcut.color.outlinedLabelColor(state: shortcut.state)
        let elevation = NatElevation.ElevationAttributes.none

        shortcut.configure(circleColor: backgroundColor)
        shortcut.configure(iconColor: iconColor)
        shortcut.configure(labelColor: labelColor)
        shortcut.configure(circleBorderWidth: 1)
        shortcut.configure(circleBorderColor: borderColor.cgColor)
        shortcut.configure(elevation: elevation)
    }
}
