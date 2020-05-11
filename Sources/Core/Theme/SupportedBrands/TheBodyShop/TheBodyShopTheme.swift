struct TheBodyShopTheme: Theme {
    let lightColorPalette: ColorPalette = TheBodyShopColorPaletteLight()
    let darkColorPalette: ColorPalette = TheBodyShopColorPaletteDark()
    let sizes: Sizes = TheBodyShopSizes()
    let spacing: Space = TheBodyShopSpacing()
    let borderRadius: BorderRadius = TheBodyShopBorderRadius()
    let font: Font = TheBodyShopFont()
}

struct TheBodyShopFont: Font {
    let sizes: FontSizes = TheBodyShopFontSizes()
    let weights: FontWeights = TheBodyShopFontWeights()
}

struct TheBodyShopFontSizes: FontSizes {
    let heading1: CGFloat = 96
    let heading2: CGFloat = 60
    let heading3: CGFloat = 48
    let heading4: CGFloat = 34
    let heading5: CGFloat = 24
    let heading6: CGFloat = 20
    let subtitle1: CGFloat = 16
    let subtitle2: CGFloat = 14
    let body1: CGFloat = 16
    let body2: CGFloat = 14
    let button: CGFloat = 14
    let caption: CGFloat = 12
    let overline: CGFloat = 12
}

struct TheBodyShopFontWeights: FontWeights {
    let regular = UIFont.Weight.regular
    let medium = UIFont.Weight.medium
}

struct NaturaFontSizes: FontSizes {
    let heading1: CGFloat = 96
    let heading2: CGFloat = 60
    let heading3: CGFloat = 48
    let heading4: CGFloat = 34
    let heading5: CGFloat = 24
    let heading6: CGFloat = 20
    let subtitle1: CGFloat = 16
    let subtitle2: CGFloat = 14
    let body1: CGFloat = 16
    let body2: CGFloat = 14
    let button: CGFloat = 14
    let caption: CGFloat = 12
    let overline: CGFloat = 12
}

struct NaturaFontWeights: FontWeights {
    let regular = UIFont.Weight.regular
    let medium = UIFont.Weight.medium
}

struct AvonFontSizes: FontSizes {
    let heading1: CGFloat = 96
    let heading2: CGFloat = 60
    let heading3: CGFloat = 48
    let heading4: CGFloat = 34
    let heading5: CGFloat = 24
    let heading6: CGFloat = 20
    let subtitle1: CGFloat = 16
    let subtitle2: CGFloat = 14
    let body1: CGFloat = 16
    let body2: CGFloat = 14
    let button: CGFloat = 14
    let caption: CGFloat = 12
    let overline: CGFloat = 12
}

struct AvonFontWeights: FontWeights {
    let regular = UIFont.Weight.regular
    let medium = UIFont.Weight.medium
}
