struct AvonTheme: Theme {
    let colors = DynamicColors(
        dynamicColorFactory: DynamicColorFactory(
            lightColorPalette: AvonColorPaletteLight(),
            darkColorPalette: AvonColorPaletteDark()
        )
    )
    let font: Font = AvonFont()
    let elevations: Elevations = AvonElevations()
}
