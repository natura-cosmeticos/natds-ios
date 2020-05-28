struct NaturaTheme: Theme {
    let lightColorPalette: ColorPalette = NaturaColorPaletteLight()
    let darkColorPalette: ColorPalette = NaturaColorPaletteDark()
    let colors = Colors2(
        colorSelector: .init(
            lightColorPalette: NaturaColorPaletteLight2(),
            darkColorPalette: NaturaColorPaletteDark2()
        )
    )
    let sizes: Sizes = NaturaSizes()
    let spacing: Space = NaturaSpacing()
    let borderRadius: BorderRadius = NaturaBorderRadius()
    let opacities: Opacities = NaturaOpacities()
    let font: Font = NaturaFont()
    let elevations: Elevations = NaturaElevations()
}
