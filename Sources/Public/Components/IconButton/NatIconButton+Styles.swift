extension NatIconButton {
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
