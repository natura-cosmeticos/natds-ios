extension NatShortcut {
    /**
     Style represents styles values for the NatShortcut component.

        These are all styles allowed for a NatShortcut:
        - containedPrimary
        - containedDefault
        - outlinedPrimary
        - outlinedDefault
    */
    public struct Style {
        let applyStyle: (NatShortcut) -> Void
    }
}

extension NatShortcut.Style {
    public static var containedPrimary: NatShortcut.Style {
        .init(
            applyStyle: ShortcutContainedStyle.applyPrimaryStyle
        )
    }

    public static var containedDefault: NatShortcut.Style {
        .init(
            applyStyle: ShortcutContainedStyle.applyDefaultStyle
        )
    }

    public static var outlinedPrimary: NatShortcut.Style {
        .init(
            applyStyle: ShortcutOutlinedStyle.applyPrimaryStyle
        )
    }

    public static var outlinedDefault: NatShortcut.Style {
        .init(
            applyStyle: ShortcutOutlinedStyle.applyDefaultStyle
        )
    }
}
