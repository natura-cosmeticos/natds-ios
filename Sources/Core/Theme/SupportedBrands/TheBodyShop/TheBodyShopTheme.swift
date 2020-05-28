struct TheBodyShopTheme: Theme {
    let lightColorPalette: ColorPalette = TheBodyShopColorPaletteLight()
    let darkColorPalette: ColorPalette = TheBodyShopColorPaletteDark()
    let colors = Colors2(
        colorSelector: .init(
            lightColorPalette: TheBodyShopColorPaletteLight2(),
            darkColorPalette: TheBodyShopColorPaletteDark2()
        )
    )
    let sizes: Sizes = TheBodyShopSizes()
    let spacing: Space = TheBodyShopSpacing()
    let borderRadius: BorderRadius = TheBodyShopBorderRadius()
    let opacities: Opacities = TheBodyShopOpacities()
    let font: Font = TheBodyShopFont()
    let elevations: Elevations = TheBodyShopElevations()
}
