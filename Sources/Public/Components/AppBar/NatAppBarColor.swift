import Foundation

public extension NatAppBar {
    enum Color {
        case `default`

        var value: UIColor {
            switch self {
            case .default: return getTheme().colors.surface
            }
        }
    }
}
