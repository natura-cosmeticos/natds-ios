struct TheBodyShopColorPaletteLight: ColorPalette {
    var primary: PrimaryColorPalette = Primary()
    var secondary: SecondaryColorPalette = Secondary()
    var surface: SurfaceColorPalette = Surface()
    var content: ContentColorPalette = Content()
    var feedback: FeedbackColorPalette = Feedback()
}

extension TheBodyShopColorPaletteLight {
    struct Primary: PrimaryColorPalette {
        var primary = "#004236"
        var onPrimary = "#FFFFFF"

        var primaryDark = "#001D10"
        var onPrimaryDark = "#FFFFFF"

        var primaryLight = "#356D60"
        var onPrimaryLight = "#FFFFFF"
    }

    struct Secondary: SecondaryColorPalette {
        var secondary = "#A55F53"
        var onSecondary = "#FFFFFF"

        var secondaryDark = "#73342A"
        var onSecondaryDark = "#FFFFFF"

        var secondaryLight = "#D98D7F"
        var onSecondaryLight = "#FFFFFF"
    }

    struct Surface: SurfaceColorPalette {
        var background = "#FAFAFA"
        var onBackground = "#333333"
        var surface = "#FFFFFF"
        var onSurface = "#333333"
    }

    struct Content: ContentColorPalette {
        var hightlight = "#000000"
        var highEmphasis = "#333333"
        var mediumEmphasis = "#777777"
        var lowEmphasis = "#BBBBBB"

        var link = "#227BBD"
        var onLink = "#FFFFFF"
    }

    struct Feedback: FeedbackColorPalette {
        var success = "#569A32"
        var onSuccess = "#FFFFFF"

        var warning = "#FCC433"
        var onWarning = "#333333"

        var alert = "#E74627"
        var onAlert = "#FFFFFF"
    }
}
