struct TheBodyShopTheme: Theme {
    let colors = DynamicColors(
        dynamicColorFactory: DynamicColorFactoryImp(
            lightColorPalette: TheBodyShopColorPaletteLight(),
            darkColorPalette: TheBodyShopColorPaletteDark()
        )
    )
    let sizes: Sizes = TheBodyShopSizes()
    let spacing: Space = TheBodyShopSpacing()
    let borderRadius: BorderRadius = TheBodyShopBorderRadius()
    let opacities: Opacities = TheBodyShopOpacities()
    let font: Font = TheBodyShopFont()
    let elevations: Elevations = TheBodyShopElevations()
}
