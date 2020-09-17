import UIKit

public extension UINavigationController {
    enum Style {
        case `default`

        var backgroundColor: UIColor {
            switch self {
            case .default: return getUIColorFromTokens(\.colorSurface)
            }
        }

        var titleColor: UIColor {
            return getUIColorFromTokens(\.colorHighEmphasis)
        }

        var elevation: NatElevation.Elevation {
            switch self {
            case .default: return .elevation02
            }
        }
    }
}
