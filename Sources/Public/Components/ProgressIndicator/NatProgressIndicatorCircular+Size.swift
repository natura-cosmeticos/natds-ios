extension NatProgressIndicatorCircular {
    /**
     Size is a enum that represents sizes values for the NatProgressIndicatorCircular component. It helps to configure height and width constraints.

        These are all sizes allowed for a NatProgressIndicatorCircular:
        - standard
    */
    public enum Size {
        public static var standard: CGFloat { getTokenFromTheme(\.sizeMedium) }
    }
}
