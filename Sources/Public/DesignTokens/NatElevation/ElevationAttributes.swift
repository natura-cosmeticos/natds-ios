extension NatElevation {
    struct ElevationAttributes {
        let shadowColor: CGColor?
        let shadowOffSet: CGSize
        let shadowRadius: CGFloat
        let shadowOpacity: Float
    }
}

extension NatElevation.ElevationAttributes {
    static var none: NatElevation.ElevationAttributes {
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

    static var micro: NatElevation.ElevationAttributes {
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

    static var tiny: NatElevation.ElevationAttributes {
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

    static var small: NatElevation.ElevationAttributes {
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

    static var medium: NatElevation.ElevationAttributes {
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

    static var large: NatElevation.ElevationAttributes {
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

    static var largeX: NatElevation.ElevationAttributes {
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

    static var largeXX: NatElevation.ElevationAttributes {
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

    static var huge: NatElevation.ElevationAttributes {
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

    static var hugeX: NatElevation.ElevationAttributes {
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

    static var hugeXX: NatElevation.ElevationAttributes {
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
