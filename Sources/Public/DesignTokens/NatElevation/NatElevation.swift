/**
  NatElevation is a struct that has access to elevation attributes properties from the Design System.
  This properties are used with view.layer to create elevation visual effect.
  According with the current Brand in the Design System this properties can change.

    Exemple of usage:

        NatElevation.apply(onView: variantCardView, with: elevation09)

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public struct NatElevation {
    public static func apply(on view: UIView, elevation: Elevation) {
        let attributes = getTokenFromTheme(elevation.rawValue)

        ViewStyle.applyElevation(on: view, with: attributes)
    }
}

extension NatElevation {
    public enum Elevation {
        case none
        case elevation01
        case elevation02
        case elevation03
        case elevation04
        case elevation05
        case elevation06
        case elevation07
        case elevation08
        case elevation09
        case elevation10

        var rawValue: KeyPath<Tokens, ElevationAttributes> {
            let keyPath: KeyPath<Tokens, ElevationAttributes>

            switch self {
            case .none: keyPath = \.elevationNone
            case .elevation01: keyPath = \.elevation01
            case .elevation02: keyPath = \.elevation02
            case .elevation03: keyPath = \.elevation03
            case .elevation04: keyPath = \.elevation04
            case .elevation05: keyPath = \.elevation05
            case .elevation06: keyPath = \.elevation06
            case .elevation07: keyPath = \.elevation07
            case .elevation08: keyPath = \.elevation08
            case .elevation09: keyPath = \.elevation09
            case .elevation10: keyPath = \.elevation10
            }

            return keyPath
        }
    }
}

//extension NatElevation {
//    var elevationNone: ElevationAttributes {
//        .init(
//            shadowColor: nil,
//            shadowOffSet: .init(width: 0, height: -3),
//            shadowRadius: 3,
//            shadowOpacity: 0
//        )
//    }
//
//    var elevation01: ElevationAttributes {
//        .init(
//            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
//            shadowOffSet: .init(width: 0, height: 1),
//            shadowRadius: 1,
//            shadowOpacity: 0.14
//        )
//    }
//
//    var elevation02: ElevationAttributes {
//        .init(
//            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
//            shadowOffSet: .init(width: 0, height: 2),
//            shadowRadius: 2,
//            shadowOpacity: 0.14
//        )
//    }
//
//    var elevation03: ElevationAttributes {
//        .init(
//            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
//            shadowOffSet: .init(width: 0, height: 3),
//            shadowRadius: 4,
//            shadowOpacity: 0.14
//        )
//    }
//
//    var elevation04: ElevationAttributes {
//        .init(
//            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
//            shadowOffSet: .init(width: 0, height: 4),
//            shadowRadius: 5,
//            shadowOpacity: 0.14
//        )
//    }
//
//    var elevation05: ElevationAttributes {
//        .init(
//            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
//            shadowOffSet: .init(width: 0, height: 6),
//            shadowRadius: 10,
//            shadowOpacity: 0.14
//        )
//    }
//
//    var elevation06: ElevationAttributes {
//        .init(
//            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
//            shadowOffSet: .init(width: 0, height: 8),
//            shadowRadius: 10,
//            shadowOpacity: 0.14
//        )
//    }
//
//    var elevation07: ElevationAttributes {
//        .init(
//            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
//            shadowOffSet: .init(width: 0, height: 9),
//            shadowRadius: 12,
//            shadowOpacity: 0.14
//        )
//    }
//
//    var elevation08: ElevationAttributes {
//        .init(
//            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
//            shadowOffSet: .init(width: 0, height: 12),
//            shadowRadius: 17,
//            shadowOpacity: 0.14
//        )
//    }
//
//    var elevation09: ElevationAttributes {
//        .init(
//            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
//            shadowOffSet: .init(width: 0, height: 16),
//            shadowRadius: 24,
//            shadowOpacity: 0.14
//        )
//    }
//
//    var elevation10: ElevationAttributes {
//        .init(
//            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
//            shadowOffSet: .init(width: 0, height: 24),
//            shadowRadius: 38,
//            shadowOpacity: 0.14
//        )
//    }
//}
