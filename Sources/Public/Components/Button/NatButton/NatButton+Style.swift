extension NatButton {
    public struct Style {
        let applyStyle: (NatButton) -> Void
        let changeState: ((NatButton) -> Void)?
        let applyTitle: (String, NatButton) -> Void
    }
}

extension NatButton.Style {
    public static var contained: NatButton.Style {
        .init(
            applyStyle: ButtonContainedStyle.applyStyle,
            changeState: ButtonContainedStyle.applyStyleForStates,
            applyTitle: ButtonContainedStyle.applyStyleForTitle
        )
    }

    public static var outlined: NatButton.Style {
        .init(
            applyStyle: ButtonOutlinedStyle.applyStyle,
            changeState: ButtonOutlinedStyle.applyStyleForStates,
            applyTitle: ButtonOutlinedStyle.applyStyleForTitle
        )
    }

    public static var text: NatButton.Style {
        .init(
            applyStyle: ButtonTextStyle.applyStyle,
            changeState: nil,
            applyTitle: ButtonTextStyle.applyStyleForTitle
        )
    }
}
