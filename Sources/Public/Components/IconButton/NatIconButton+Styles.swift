extension NatIconButton {

    /**
     Style represents style values for the NatIconButton component, which apply different colors for the icon.
     
     These are all styles allowed for a NatIconButton:
     - standardDefault (default: icon has `highEmphasis` color)
     - standardPrimary (icon has `primary` color)
     - standardLight (icon has `surface` color)
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

        public static var standardLight: Style {
            .init(
                applyStyle: IconButtonStandardStyle.applyLightStyle
            )
        }
    }
}
