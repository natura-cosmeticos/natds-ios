public final class NatElevation {
    public init() {}

    public func apply(onView view: UIView, elevation: Elevation) {
        let elevation = getTheme().elevations[keyPath: elevation.rawValue]
        ViewStyling().setElevation(onView: view, with: elevation)
    }
}

extension NatElevation {
    public enum Elevation {
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

        var rawValue: KeyPath<Elevations, ElevationAttributes> {
            let keyPath: KeyPath<Elevations, ElevationAttributes>

            switch self {
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
