import Foundation

extension UIViewController {
    @available(*, deprecated, message: "TitleStyle is deprecated, check AppBar documentation")
    public enum TitleStyle {
        case logo
        case title(String)
    }

    public enum TitlePosition {
        case left(String)
        case center(String)
    }
}
