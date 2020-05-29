struct DynamicColorFactoryImp: DynamicColorFactory {
    private let lightColorPalette: ColorPalette
    private let darkColorPalette: ColorPalette

    init(lightColorPalette: ColorPalette, darkColorPalette: ColorPalette) {
        self.lightColorPalette = lightColorPalette
        self.darkColorPalette = darkColorPalette
    }

    func createDynamicColor(for keyPath: KeyPath<ColorPalette, String>) -> UIColor {
        createColor(
            hexLight: lightColorPalette[keyPath: keyPath],
            hexDark: darkColorPalette[keyPath: keyPath]
        )
    }

    private func createColor(hexLight: String, hexDark: String) -> UIColor {
        if #available(iOS 13.0, *) {
            return .init { (UITraitCollection) -> UIColor in
                UITraitCollection.userInterfaceStyle == .dark ?
                    .hexColorOrDefault(hexDark) :
                    .hexColorOrDefault(hexLight)
            }
        } else {
            return .hexColorOrDefault(hexLight)
        }
    }
}

protocol DynamicColorFactory {
    func createDynamicColor(for keyPath: KeyPath<ColorPalette, String>) -> UIColor
}
