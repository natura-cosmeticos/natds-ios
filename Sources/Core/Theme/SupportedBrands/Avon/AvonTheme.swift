struct AvonTheme: Theme {
    let lightColorPalette: ColorPalette = AvonColorPaletteLight()
    let darkColorPalette: ColorPalette = AvonColorPaletteDark()
    let colors = Colors2(
        colorSelector: .init(
            lightColorPalette: AvonColorPaletteLight2(),
            darkColorPalette: AvonColorPaletteDark2()
        )
    )
    let sizes: Sizes = AvonSizes()
    let spacing: Space = AvonSpacing()
    let borderRadius: BorderRadius = AvonBorderRadius()
    let opacities: Opacities = AvonOpacities()
    let font: Font = AvonFont()
    let elevations: Elevations = AvonElevations()
}
