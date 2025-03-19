//
//  GaYaElevation.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 14/03/25.
//  Copyright © 2025 Natura. All rights reserved.
//

public struct GaYaElevation {
    public static func apply(on view: UIView, elevation: Elevation) {
        let attributes = elevation.relatedElevation

        ViewStyle.applyGaYaElevation(on: view, with: attributes)
    }
}

extension GaYaElevation {
    public enum Elevation {
        case none
        case micro
        case tiny
        case small
        case medium
        case large
        case largeX
        case largeXX
        case huge
        case hugeX
        case hugeXX

        @available(*, deprecated, message: "use .micro instead")
        case elevation01
        @available(*, deprecated, message: "use .tiny instead")
        case elevation02
        @available(*, deprecated, message: "use .small instead")
        case elevation03
        @available(*, deprecated, message: "use .medium instead")
        case elevation04
        @available(*, deprecated, message: "use .large instead")
        case elevation05
        @available(*, deprecated, message: "use .largeX instead")
        case elevation06
        @available(*, deprecated, message: "use .largeXX instead")
        case elevation07
        @available(*, deprecated, message: "use .huge instead")
        case elevation08
        @available(*, deprecated, message: "use .hugeX instead")
        case elevation09
        @available(*, deprecated, message: "use .hugeXX instead")
        case elevation10

        var relatedElevation: ElevationAttributes {
            let attributes: ElevationAttributes

            switch self {
            case .none:    attributes = .none
            case .micro:   attributes = .micro
            case .tiny:    attributes = .tiny
            case .small:   attributes = .small
            case .medium:  attributes = .medium
            case .large:   attributes = .large
            case .largeX:  attributes = .largeX
            case .largeXX: attributes = .largeXX
            case .huge:    attributes = .huge
            case .hugeX:   attributes = .hugeX
            case .hugeXX:  attributes = .hugeXX

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
