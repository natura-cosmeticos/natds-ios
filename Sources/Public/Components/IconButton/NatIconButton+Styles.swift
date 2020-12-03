extension NatIconButton {
    /**
     Style represents styles values for the NatIconButton component.
     
        These are all styles allowed for a NatIconButton:
        - standardDefault
        - standardPrimary
    */
    public struct Style {
        let applyStyle: (NatIconButton) -> Void

        public static var standardDefault: Style {
            .init(
                applyStyle: IconButtonStandardStyle.applyDefaultStyle
            )
        }

        public static var standardPrimary: Style {
            .init(
                applyStyle: IconButtonStandardStyle.applyPrimaryStyle
            )
        }
    }
}
