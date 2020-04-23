struct TheBodyShopColorPaletteLight: ColorPalette {
    let primary: PrimaryColorPalette = Primary()
    let secondary: SecondaryColorPalette = Secondary()
    let surface: SurfaceColorPalette = Surface()
    let content: ContentColorPalette = Content()
    let feedback: FeedbackColorPalette = Feedback()
}

extension TheBodyShopColorPaletteLight {
    struct Primary: PrimaryColorPalette {
        let primary = "#004236"
        let onPrimary = "#FFFFFF"

        let primaryLight = "#356D60"
        let onPrimaryLight = "#FFFFFF"

        let primaryDark = "#001D10"
        let onPrimaryDark = "#FFFFFF"
    }

    struct Secondary: SecondaryColorPalette {
        let secondary = "#A55F53"
        let onSecondary = "#FFFFFF"

        let secondaryLight = "#D98D7F"
        let onSecondaryLight = "#FFFFFF"

        let secondaryDark = "#73342A"
        let onSecondaryDark = "#FFFFFF"
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
