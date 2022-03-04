enum ShortcutOutlinedStyle {
    static func apply(on shortcut: NatShortcut) {
        let circleColor = shortcut.state == .enabled ?
            shortcut.color.enabledOutlinedBackgroundColor : shortcut.color.disabledOutlinedBackgroundColor
        let circleBorderColor = shortcut.state == .enabled ?
            shortcut.color.enabledOutlinedBorderColor : shortcut.color.disabledOutlinedBorderColor
        let iconColor = shortcut.state == .enabled ?
            shortcut.color.enabledIconColor : shortcut.color.disabledIconColor

        shortcut.configure(circleColor: circleColor)
        shortcut.configure(circleBorderColor: circleBorderColor.cgColor)
        shortcut.configure(circleBorderWidth: 1)
        shortcut.configure(iconColor: iconColor)

        let elevation = NatElevation.ElevationAttributes.none
        ViewStyle.applyElevation(on: shortcut, with: elevation)
    }
}
