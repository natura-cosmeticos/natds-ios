struct TheBodyShopColorPaletteDark: ColorPalette {
    var primary: PrimaryColorPalette = Primary()
    var secondary: SecondaryColorPalette = Secondary()
    var surface: SurfaceColorPalette = Surface()
    var content: ContentColorPalette = Content()
    var feedback: FeedbackColorPalette = Feedback()
}

extension TheBodyShopColorPaletteDark {
    struct Primary: PrimaryColorPalette {
        var primary = "#62B3AE"
        var onPrimary = "#000000"

        var primaryDark = "#2F837F"
        var onPrimaryDark = "#000000"

        var primaryLight = "#94E5E0"
        var onPrimaryLight = "#000000"
    }

    struct Secondary: SecondaryColorPalette {
        let secondary = "#D2AD93"
        var onSecondary = "#000000"

        var secondaryDark = "#A07E65"
        var onSecondaryDark = "#000000"

        var secondaryLight = "#FFDFC4"
        var onSecondaryLight = "#000000"
    }

    struct Surface: SurfaceColorPalette {
        var background = "#121212"
        var onBackground = "#FFFFFF"

        var surface = "#333333"
        var onSurface = "#FFFFFF"
    }

    struct Content: ContentColorPalette {
        var hightlight = "#FFFFFF"
        var highEmphasis = "#FAFAFA"
        var mediumEmphasis = "#BBBBBB"
        var lowEmphasis = "#777777"

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
