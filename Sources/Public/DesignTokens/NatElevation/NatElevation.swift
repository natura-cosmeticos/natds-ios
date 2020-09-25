/**
  NatElevation is a struct that has access to elevation attributes properties from the Design System.
  This properties are used with view.layer to create elevation visual effect.
  According with the current theme in the Design System this properties can change.

    Exemple of usage:

        NatElevation.apply(onView: variantCardView, with: elevation09)

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public struct NatElevation {
    public static func apply(on view: UIView, elevation: Elevation) {
        let attributes = elevation.relatedElevation

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

        var relatedElevation: ElevationAttributes {
            let attributes: ElevationAttributes

            switch self {
            case .none: attributes = .none
            case .elevation01: attributes = .micro
            case .elevation02: attributes = .tiny
            case .elevation03: attributes = .small
            case .elevation04: attributes = .medium
            case .elevation05: attributes = .large
            case .elevation06: attributes = .largeX
            case .elevation07: attributes = .largeXX
            case .elevation08: attributes = .huge
            case .elevation09: attributes = .hugeX
            case .elevation10: attributes = .hugeXX
            }

            return attributes
        }
    }
}
