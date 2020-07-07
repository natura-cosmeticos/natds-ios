extension NatShortcut {
    public struct Style {
        let applyStyle: (NatShortcut) -> Void
    }
}

extension NatShortcut.Style {
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

    public static var containedPrimary: NatShortcut.Style {
        .init(
            applyStyle: ShortcutOutlinedStyle.applyPrimaryStyle
        )
    }

    public static var containedDefault: NatShortcut.Style {
        .init(
            applyStyle: ShortcutOutlinedStyle.applyDefaultStyle
        )
    }
}
