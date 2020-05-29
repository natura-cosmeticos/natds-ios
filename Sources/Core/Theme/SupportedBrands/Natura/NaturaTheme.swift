struct NaturaTheme: Theme {
    let colors = DynamicColors(
        dynamicColorFactory: DynamicColorFactoryImp(
            lightColorPalette: NaturaColorPaletteLight(),
            darkColorPalette: NaturaColorPaletteDark()
        )
    )
    let sizes: Sizes = NaturaSizes()
    let spacing: Space = NaturaSpacing()
    let borderRadius: BorderRadius = NaturaBorderRadius()
    let opacities: Opacities = NaturaOpacities()
    let font: Font = NaturaFont()
    let elevations: Elevations = NaturaElevations()
}
