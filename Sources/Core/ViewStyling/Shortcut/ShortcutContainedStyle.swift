enum ShortcutContainedStyle {
    static func apply(on shortcut: NatShortcut) {
        let circleColor = shortcut.state == .enabled ?
            shortcut.color.enabledContainedBackgroundColor : shortcut.color.disabledContainedBackgroundColor
        let iconColor = shortcut.state == .enabled ?
            shortcut.color.enabledIconColor : shortcut.color.disabledIconColor

        shortcut.configure(circleColor: circleColor)
        shortcut.configure(iconColor: iconColor)

        let elevation = NatElevation.ElevationAttributes.tiny
        ViewStyle.applyElevation(on: shortcut, with: elevation)
    }
}
