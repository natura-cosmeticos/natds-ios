extension NatButton {
    public struct Style {
        let applyStyle: (NatButton) -> Void
        let changeState: (NatButton) -> Void
        let applyTitle: (String?, NatButton) -> Void
    }
}

extension NatButton.Style {
    public static var outlined: NatButton.Style {
        .init(
            applyStyle: ButtonOutlinedStyle.applyStyle,
            changeState: ButtonOutlinedStyle.applyStyleForStates,
            applyTitle: ButtonOutlinedStyle.applyStyleForTitle
        )
    }
}
