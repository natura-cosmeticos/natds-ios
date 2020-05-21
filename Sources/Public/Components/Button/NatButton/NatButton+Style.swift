extension NatButton {
    public struct Style {
        let apply: (NatButton) -> Void
        let changeState: (NatButton) -> Void
        let applyTitle: (String?, NatButton) -> Void
    }
}

extension NatButton.Style {
    public static var outlined: NatButton.Style {
        .init(
            apply: ButtonOutlinedStyle.applyStyle,
            changeState: ButtonOutlinedStyle.applyStyleForStates,
            applyTitle: ButtonOutlinedStyle.applyStyleForTitle
        )
    }
}
