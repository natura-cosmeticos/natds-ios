public enum Size: CGFloat {
    case small
    case medium
    case large
    case xLarge

    var value: CGFloat {
        switch self {
        case .small: return getTokenFromTheme(\.sizeSmall)
        case .medium: return getTokenFromTheme(\.sizeMedium)
        case .large: return getTokenFromTheme(\.sizeLarge)
        case .xLarge: return getTokenFromTheme(\.sizeLargeX)
        }
    }
}

//
//extension NatProgressIndicatorCircular {
//    /**
//     Size is a enum that represents sizes values for the NatProgressIndicatorCircular component.
//     It helps to configure height and width constraints.
//
//        These are all sizes allowed for a NatProgressIndicatorCircular:
//        - standard
//    */
//    public enum Size: CGFloat {
//
//        public static var small: CGFloat { getTokenFromTheme(\.sizeSmall) }
//        public static var medium: CGFloat { getTokenFromTheme(\.sizeMedium) }
//        public static var large: CGFloat { getTokenFromTheme(\.sizeLarge) }
//        public static var xLarge: CGFloat { getTokenFromTheme(\.sizeLargeX) }
//    }
//}
