@objcMembers
public class Colors: NSObject {
    public static let primary: UIColor = ColorsNatura.Primary.yellow
    public static let secondary: UIColor = ColorsNatura.Primary.orange
    public static let surfaceLight: UIColor = ColorsNatura.Surface.background
    public static let surfaceDark: UIColor = ColorsNatura.Surface.backgroundOn

    public class Content {
        public static let highlight = ColorsNatura.Content.highlight
        public static let highEmphasis = ColorsNatura.Content.highEmphasis
        public static let mediumEmphasis = ColorsNatura.Content.mediumEmphasis
        public static let lowEmphasis: UIColor = ColorsNatura.Content.lowEmphasis
    }

    public class Feedback {
        public static let alert = ColorsNatura.Feedback.alert
        public static let success = ColorsNatura.Feedback.success
    }
}
