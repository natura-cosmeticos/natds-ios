struct NaturaColorPaletteDark: ColorPalette {
    let primary: PrimaryColorPalette = Primary()
    let secondary: SecondaryColorPalette = Secondary()
    let surface: SurfaceColorPalette = Surface()
    let content: ContentColorPalette = Content()
    let feedback: FeedbackColorPalette = Feedback()
}

extension NaturaColorPaletteDark {
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
