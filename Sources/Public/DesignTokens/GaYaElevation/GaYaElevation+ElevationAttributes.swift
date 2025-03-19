//
//  GaYaElevationAttributes.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 17/03/25.
//  Copyright © 2025 Natura. All rights reserved.
//

extension GaYaElevation {
    struct ElevationAttributes {
        let shadowColor: CGColor?
        let shadowOffSet: CGSize
        let shadowRadius: CGFloat
        let shadowOpacity: Float
    }
}

extension GaYaElevation.ElevationAttributes {
    static var none: GaYaElevation.ElevationAttributes {
        .init(
            shadowColor: nil,
            shadowOffSet: .init(
                width: getTokenFromTheme(\.elevationNoneShadowOffsetWidth),
                height: getTokenFromTheme(\.elevationNoneShadowOffsetHeight)
            ),
            shadowRadius: getTokenFromTheme(\.elevationNoneShadowRadius),
            shadowOpacity: getTokenFromTheme(\.elevationNoneShadowOpacity)
        )
    }

    static var micro: GaYaElevation.ElevationAttributes {
        .init(
            shadowColor: getUIColorFromTokens(\.elevationMicroShadowColor).cgColor,
            shadowOffSet: .init(
                width: getTokenFromTheme(\.elevationMicroShadowOffsetWidth),
                height: getTokenFromTheme(\.elevationMicroShadowOffsetHeight)
            ),
            shadowRadius: getTokenFromTheme(\.elevationMicroShadowRadius),
            shadowOpacity: getTokenFromTheme(\.elevationMicroShadowOpacity)
        )
    }

    static var tiny: GaYaElevation.ElevationAttributes {
        .init(
            shadowColor: getUIColorFromTokens(\.elevationTinyShadowColor).cgColor,
            shadowOffSet: .init(
                width: getTokenFromTheme(\.elevationTinyShadowOffsetWidth),
                height: getTokenFromTheme(\.elevationTinyShadowOffsetHeight)
            ),
            shadowRadius: getTokenFromTheme(\.elevationTinyShadowRadius),
            shadowOpacity: getTokenFromTheme(\.elevationTinyShadowOpacity)
        )
    }

    static var small: GaYaElevation.ElevationAttributes {
        .init(
            shadowColor: getUIColorFromTokens(\.elevationSmallShadowColor).cgColor,
            shadowOffSet: .init(
                width: getTokenFromTheme(\.elevationSmallShadowOffsetWidth),
                height: getTokenFromTheme(\.elevationSmallShadowOffsetHeight)
            ),
            shadowRadius: getTokenFromTheme(\.elevationSmallShadowRadius),
            shadowOpacity: getTokenFromTheme(\.elevationSmallShadowOpacity)
        )
    }

    static var medium: GaYaElevation.ElevationAttributes {
        .init(
            shadowColor: getUIColorFromTokens(\.elevationMediumShadowColor).cgColor,
            shadowOffSet: .init(
                width: getTokenFromTheme(\.elevationLargeShadowOffsetWidth),
                height: getTokenFromTheme(\.elevationMediumShadowOffsetHeight)
            ),
            shadowRadius: getTokenFromTheme(\.elevationMediumShadowRadius),
            shadowOpacity: getTokenFromTheme(\.elevationMediumShadowOpacity)
        )
    }

    static var large: GaYaElevation.ElevationAttributes {
        .init(
            shadowColor: getUIColorFromTokens(\.elevationLargeShadowColor).cgColor,
            shadowOffSet: .init(
                width: getTokenFromTheme(\.elevationLargeShadowOffsetWidth),
                height: getTokenFromTheme(\.elevationLargeShadowOffsetHeight)
            ),
            shadowRadius: getTokenFromTheme(\.elevationLargeShadowRadius),
            shadowOpacity: getTokenFromTheme(\.elevationLargeShadowOpacity)
        )
    }

    static var largeX: GaYaElevation.ElevationAttributes {
        .init(
            shadowColor: getUIColorFromTokens(\.elevationLargeXShadowColor).cgColor,
            shadowOffSet: .init(
                width: getTokenFromTheme(\.elevationLargeXShadowOffsetWidth),
                height: getTokenFromTheme(\.elevationLargeXShadowOffsetWidth)
            ),
            shadowRadius: getTokenFromTheme(\.elevationLargeXShadowRadius),
            shadowOpacity: getTokenFromTheme(\.elevationLargeXShadowOpacity)
        )
    }

    static var largeXX: GaYaElevation.ElevationAttributes {
        .init(
            shadowColor: getUIColorFromTokens(\.elevationLargeXXShadowColor).cgColor,
            shadowOffSet: .init(
                width: getTokenFromTheme(\.elevationLargeXXShadowOffsetWidth),
                height: getTokenFromTheme(\.elevationLargeXXShadowOffsetHeight)
            ),
            shadowRadius: getTokenFromTheme(\.elevationLargeXXShadowRadius),
            shadowOpacity: getTokenFromTheme(\.elevationLargeXXShadowOpacity)
        )
    }

    static var huge: GaYaElevation.ElevationAttributes {
        .init(
            shadowColor: getUIColorFromTokens(\.elevationHugeShadowColor).cgColor,
            shadowOffSet: .init(
                width: getTokenFromTheme(\.elevationHugeShadowOffsetWidth),
                height: getTokenFromTheme(\.elevationHugeShadowOffsetHeight)
            ),
            shadowRadius: getTokenFromTheme(\.elevationHugeShadowRadius),
            shadowOpacity: getTokenFromTheme(\.elevationHugeShadowOpacity)
        )
    }

    static var hugeX: GaYaElevation.ElevationAttributes {
        .init(
            shadowColor: getUIColorFromTokens(\.elevationHugeXShadowColor).cgColor,
            shadowOffSet: .init(
                width: getTokenFromTheme(\.elevationHugeXShadowOffsetWidth),
                height: getTokenFromTheme(\.elevationHugeXShadowOffsetHeight)
            ),
            shadowRadius: getTokenFromTheme(\.elevationHugeXShadowRadius),
            shadowOpacity: getTokenFromTheme(\.elevationHugeXShadowOpacity)
        )
    }

    static var hugeXX: GaYaElevation.ElevationAttributes {
        .init(
            shadowColor: getUIColorFromTokens(\.elevationHugeXXShadowColor).cgColor,
            shadowOffSet: .init(
                width: getTokenFromTheme(\.elevationHugeXXShadowOffsetWidth),
                height: getTokenFromTheme(\.elevationHugeXXShadowOffsetHeight)
            ),
            shadowRadius: getTokenFromTheme(\.elevationHugeXXShadowRadius),
            shadowOpacity: getTokenFromTheme(\.elevationHugeXXShadowOpacity)
        )
    }
}

