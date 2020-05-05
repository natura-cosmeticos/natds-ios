struct NaturaColorPaletteLight: ColorPalette {
    let primary: PrimaryColorPalette = Primary()
    let secondary: SecondaryColorPalette = Secondary()
    let surface: SurfaceColorPalette = Surface()
    let content: ContentColorPalette = Content()
    let feedback: FeedbackColorPalette = Feedback()
}

extension NaturaColorPaletteLight {
    struct Primary: PrimaryColorPalette {
        let primary = "#F4AB34"
        let onPrimary = "#333333"

        let primaryLight = "#FEFDE8"
        let onPrimaryLight = "#333333"

        let primaryDark = "#EF8426"
        let onPrimaryDark = "#333333"
    }

    struct Secondary: SecondaryColorPalette {
        let secondary = "#FF6B0B"
        let onSecondary = "#000000"

        let secondaryLight = "#FFF8E1"
        let onSecondaryLight = "#000000"

        let secondaryDark = "#FF5808"
        let onSecondaryDark = "#000000"
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
    }

    struct Feedback: FeedbackColorPalette {
        let success = "#569A32"
        let onSuccess = "#FFFFFF"

        let warning = "#FCC433"
        let onWarning = "#333333"

        let alert = "#E74627"
        let onAlert = "#FFFFFF"

        let link = "#227BBD"
        let onLink = "#FFFFFF"
    }
}
