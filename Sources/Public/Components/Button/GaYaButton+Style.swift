extension GaYaButton {
    /**
     Style is a enum that represents style values for the button component.
     
     These are all styles allowed for a GaYaButton:
     - filled
     - outlined
     - ghost
     
     Example of usage:
     
            let filledButton = GaYaButton(style: .filled)
            let outlinedButton = GaYaButton(style: .outlined)
            let textButton = GaYaButton(style: .text)
     
     - Requires:
     It's necessary to configure the Design System with a theme or fatalError will be raised.
     
            DesignSystem().configure(with: AvailableTheme)
     */

    public struct Style {
        let applyStyle: (AvailableTheme, GaYaButtonColor, GaYaButton) -> Void
        let changeState: (AvailableTheme, GaYaButtonColor, GaYaButton) -> Void?
        let applyTitle: (String, AvailableTheme, GaYaButtonColor, GaYaButton) -> Void
    }
}

extension GaYaButton.Style {
    public static var filled: GaYaButton.Style {
        .init(
            applyStyle: GaYaButtonFilledStyle.applyStyle,
            changeState: GaYaButtonFilledStyle.applyStyleForStates,
            applyTitle: GaYaButtonFilledStyle.applyStyleForTitle
        )
    }

    public static var outlined: GaYaButton.Style {
        .init(
            applyStyle: GaYaButtonOutlinedStyle.applyStyle,
            changeState: GaYaButtonOutlinedStyle.applyStyleForStates,
            applyTitle: GaYaButtonOutlinedStyle.applyStyleForTitle
        )
    }

    public static var ghost: GaYaButton.Style {
        .init(
            applyStyle: GaYaButtonGhostStyle.applyStyle,
            changeState: GaYaButtonGhostStyle.applyStyleForStates,
            applyTitle: GaYaButtonGhostStyle.applyStyleForTitle
        )
    }
    
    public static var tonal: GaYaButton.Style {
        .init(
            applyStyle: GaYaButtonTonalStyle.applyStyle,
            changeState: GaYaButtonTonalStyle.applyStyleForStates,
            applyTitle: GaYaButtonTonalStyle.applyStyleForTitle
        )
    }
}
