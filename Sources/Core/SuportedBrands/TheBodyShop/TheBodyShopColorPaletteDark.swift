struct TheBodyShopColorPaletteDark: ColorPalette {
    let primary: PrimaryColorPalette = Primary()
    let secondary: SecondaryColorPalette = Secondary()
    let surface: SurfaceColorPalette = Surface()
    let content: ContentColorPalette = Content()
    let feedback: FeedbackColorPalette = Feedback()
}

private extension TheBodyShopColorPaletteDark {
    struct Primary: PrimaryColorPalette {
        let primary = "#62B3AE"
        let onPrimary = "#000000"

        let primaryDark = "#2F837F"
        let onPrimaryDark = "#000000"

        let primaryLight = "#94E5E0"
        let onPrimaryLight = "#000000"
    }

    struct Secondary: SecondaryColorPalette {
        let secondary = "#D2AD93"
        let onSecondary = "#000000"

        let secondaryDark = "#A07E65"
        let onSecondaryDark = "#000000"

        let secondaryLight = "#FFDFC4"
        let onSecondaryLight = "#000000"
    }

    struct Surface: SurfaceColorPalette {
        let background = "#121212"
        let onBackground = "#FFFFFF"

        let surface = "#333333"
        let onSurface = "#FFFFFF"
    }

    struct Content: ContentColorPalette {
        let hightlight = "#FFFFFF"
        let highEmphasis = "#FAFAFA"
        let mediumEmphasis = "#BBBBBB"
        let lowEmphasis = "#777777"

        let link = "#227BBD"
        let onLink = "#FFFFFF"
    }

    struct Feedback: FeedbackColorPalette {
        let success = "#569A32"
        let onSuccess = "#FFFFFF"

        let warning = "#FCC433"
        let onWarning = "#333333"

        let alert = "#E74627"
        let onAlert = "#FFFFFF"
    }
}
