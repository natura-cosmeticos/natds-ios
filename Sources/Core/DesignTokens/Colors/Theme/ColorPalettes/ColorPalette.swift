protocol ColorPalette {
    var primary: PrimaryColorPalette { get }
    var secondary: SecondaryColorPalette { get }
    var surface: SurfaceColorPalette { get }
    var content: ContentColorPalette { get }
    var feedback: FeedbackColorPalette { get }
}
