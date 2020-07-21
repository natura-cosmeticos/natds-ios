import UIKit

public extension UINavigationController {
    enum Style {
        case `default`

        var backgroundColor: UIColor {
            switch self {
            case .default: return getTheme().colors.surface
            }
        }

        var titleColor: UIColor {
            return getTheme().colors.highEmphasis
        }

        var elevation: NatElevation.Elevation {
            switch self {
            case .default: return .elevation02
            }
        }
    }
}
