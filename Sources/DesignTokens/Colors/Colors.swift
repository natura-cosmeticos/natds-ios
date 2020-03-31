@objcMembers
public class Colors: NSObject {
    public static let primary = ColorsNatura.Primary.yellow
    public static let secondary = ColorsNatura.Primary.orange

    @available(*, deprecated, message: "Moved to Colors.Surface.surfaceOn")
    public static let surfaceDark = ColorsNatura.Surface.surfaceOn

    public class Content {
        public static let highlight = ColorsNatura.Content.highlight
        public static let highEmphasis = ColorsNatura.Content.highEmphasis
        public static let mediumEmphasis = ColorsNatura.Content.mediumEmphasis
        public static let lowEmphasis = ColorsNatura.Content.lowEmphasis
    }

    public class Surface {
        public static let surface = ColorsNatura.Surface.surface
        public static let surfaceOn = ColorsNatura.Surface.surfaceOn
        public static let background = ColorsNatura.Surface.background
        public static let backgroundOn = ColorsNatura.Surface.backgroundOn

    }

    public class Feedback {
        public static let alert = ColorsNatura.Feedback.alert
        public static let success = ColorsNatura.Feedback.success
    }
}
