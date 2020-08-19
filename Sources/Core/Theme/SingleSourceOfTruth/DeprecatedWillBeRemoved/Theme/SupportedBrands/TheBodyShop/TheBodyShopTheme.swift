struct TheBodyShopTheme: Theme {
    let colors = DynamicColors(
        dynamicColorFactory: DynamicColorFactory(
            lightColorPalette: TheBodyShopColorPaletteLight(),
            darkColorPalette: TheBodyShopColorPaletteDark()
        )
    )
    let font: Font = TheBodyShopFont()
    let elevations: Elevations = TheBodyShopElevations()
}
