struct NaturaTheme: Theme {
    let colors = DynamicColors(
        dynamicColorFactory: DynamicColorFactory(
            lightColorPalette: NaturaColorPaletteLight(),
            darkColorPalette: NaturaColorPaletteDark()
        )
    )
    let font: Font = NaturaFont()
    let elevations: Elevations = NaturaElevations()
}
