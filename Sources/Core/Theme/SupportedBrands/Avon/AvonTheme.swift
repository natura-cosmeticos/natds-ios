struct AvonTheme: Theme {
    let colors = DynamicColors(
        dynamicColorFactory: DynamicColorFactory(
            lightColorPalette: AvonColorPaletteLight(),
            darkColorPalette: AvonColorPaletteDark()
        )
    )
    let sizes: Sizes = AvonSizes()
    let spacing: Space = AvonSpacing()
    let borderRadius: BorderRadius = AvonBorderRadius()
    let opacities: Opacities = AvonOpacities()
    let font: Font = AvonFont()
    let elevations: Elevations = AvonElevations()
}
