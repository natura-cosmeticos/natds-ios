import UIKit

public extension UINavigationController {
    enum Color {
        case `default`

        var background: UIColor {
            switch self {
            case .default: return getTheme().colors.surface
            }
        }

        var title: UIColor {
            return getTheme().colors.highEmphasis
        }
    }
}
