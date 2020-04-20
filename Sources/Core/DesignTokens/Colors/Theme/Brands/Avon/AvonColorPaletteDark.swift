struct AvonColorPaletteDark: ColorPalette {
    let primary: PrimaryColorPalette = Primary()
    let secondary: SecondaryColorPalette = Secondary()
    let surface: SurfaceColorPalette = Surface()
    let content: ContentColorPalette = Content()
    let feedback: FeedbackColorPalette = Feedback()
}

extension AvonColorPaletteDark {
    struct Primary: PrimaryColorPalette {
        let primary = "#F091C9"
        var onPrimary = "#000000"

        let primaryDark = "#BC6198"
        var onPrimaryDark = "#000000"

        let primaryLight = "#FFC3FC"
        var onPrimaryLight = "#000000"
    }

    struct Secondary: SecondaryColorPalette {
        let secondary = "#E9E9E9"
        var onSecondary = "#333333"

        let secondaryDark = "#B7B7B7"
        var onSecondaryDark = "#333333"

        let secondaryLight = "#FFFFFF"
        var onSecondaryLight = "#333333"
    }

    struct Surface: SurfaceColorPalette {
        let background = "#121212"
        var onBackground = "#FFFFFF"

        let surface = "#333333"
        var onSurface = "#FFFFFF"
    }

    struct Content: ContentColorPalette {
        let hightlight = "#FFFFFF"
        let highEmphasis = "#FAFAFA"
        let mediumEmphasis = "#BBBBBB"
        let lowEmphasis = "#777777"

        let link = "#227BBD"
        var onLink = "#FFFFFF"
    }

    struct Feedback: FeedbackColorPalette {
        let success = "#569A32"
        var onSuccess = "#FFFFFF"

        let warning = "#FCC433"
        var onWarning = "#333333"

        let alert = "#E74627"
        var onAlert = "#FFFFFF"
    }
}
