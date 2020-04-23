struct AvonColorPaletteLight: ColorPalette {
    let primary: PrimaryColorPalette = Primary()
    let secondary: SecondaryColorPalette = Secondary()
    let surface: SurfaceColorPalette = Surface()
    let content: ContentColorPalette = Content()
    let feedback: FeedbackColorPalette = Feedback()
}

extension AvonColorPaletteLight {
    struct Primary: PrimaryColorPalette {
        let primary = "#DE0085"
        let onPrimary = "#FFFFFF"

        let primaryDark = "#A70058"
        let onPrimaryDark = "#FFFFFF"

        let primaryLight = "#FF56B5"
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
        let background = "#FAFAFA"
        let onBackground = "#333333"

        let surface = "#FFFFFF"
        let onSurface = "#333333"
    }

    struct Content: ContentColorPalette {
        let highlight = "#000000"
        let highEmphasis = "#333333"
        let mediumEmphasis = "#777777"
        let lowEmphasis = "#BBBBBB"

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
