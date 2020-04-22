struct AvonColorPaletteDark: ColorPalette {
    let primary: PrimaryColorPalette = Primary()
    let secondary: SecondaryColorPalette = Secondary()
    let surface: SurfaceColorPalette = Surface()
    let content: ContentColorPalette = Content()
    let feedback: FeedbackColorPalette = Feedback()
}

private extension AvonColorPaletteDark {
    struct Primary: PrimaryColorPalette {
        let primary = "#F091C9"
        let onPrimary = "#000000"

        let primaryDark = "#BC6198"
        let onPrimaryDark = "#000000"

        let primaryLight = "#FFC3FC"
        let onPrimaryLight = "#000000"
    }

    struct Secondary: SecondaryColorPalette {
        let secondary = "#E9E9E9"
        let onSecondary = "#333333"

        let secondaryDark = "#B7B7B7"
        let onSecondaryDark = "#333333"

        let secondaryLight = "#FFFFFF"
        let onSecondaryLight = "#333333"
    }

    struct Surface: SurfaceColorPalette {
        let background = "#121212"
        let onBackground = "#FFFFFF"

        let surface = "#333333"
        let onSurface = "#FFFFFF"
    }

    struct Content: ContentColorPalette {
        let highlight = "#FFFFFF"
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
