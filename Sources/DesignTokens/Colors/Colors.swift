@objcMembers
public class Colors: NSObject {
    public static let primary: UIColor = ColorsNatura.Primary.yellow
    public static let secondary: UIColor = ColorsNatura.Primary.orange
    public static let surfaceDark: UIColor = ColorsNatura.PB.gray3

    /// DEPRECATED: Will be removed in version 0.0.18
    @available(*, deprecated, message: "highlight is deprecated instead use Colors.Content.highLight")
    public static let highlight: UIColor = ColorsNatura.PB.black
    /// DEPRECATED: Will be removed in version 0.0.18
    @available(*, deprecated, message: "highEmphasis is deprecated instead use Colors.Content.highEmphasis")
    public static let highEmphasis: UIColor = ColorsNatura.PB.gray
    /// DEPRECATED: Will be removed in version 0.0.18
    @available(*, deprecated, message: "lowEmphasis is deprecated instead use Colors.Content.lowEmphasis")
    public static let lowEmphasis: UIColor = ColorsNatura.PB.gray2

    public class Content {
        public static let highlight = ColorsNatura.Content.highlight
        public static let highEmphasis = ColorsNatura.Content.highEmphasis
        public static let mediumEmphasis = ColorsNatura.Content.mediumEmphasis
        public static let lowEmphasis: UIColor = ColorsNatura.Content.lowEmphasis
    }

    public class Feedback {
        public static let alert = ColorsNatura.Feedback.alert
    }

}
