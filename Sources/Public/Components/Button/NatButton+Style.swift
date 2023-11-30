extension NatButton {
    /**
     Style is a enum that represents style values for the button component.
     
     These are all styles allowed for a NatButton:
     - contained
     - outlined
     - text
     
     Example of usage:
     
            let containedButton = NatButton(style: .contained)
            let outlinedButton = NatButton(style: .outlined)
            let textButton = NatButton(style: .text)
     
     - Requires:
     It's necessary to configure the Design System with a theme or fatalError will be raised.
     
            DesignSystem().configure(with: AvailableTheme)
     */

    public struct Style {
        let applyStyle: (AvailableTheme, Color, NatButton) -> Void
        let changeState: (AvailableTheme, Color, NatButton) -> Void?
        let applyTitle: (String, AvailableTheme, Color, NatButton) -> Void
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
            changeState: ButtonTextStyle.applyStyleForStates,
            applyTitle: ButtonTextStyle.applyStyleForTitle
        )
    }
}
