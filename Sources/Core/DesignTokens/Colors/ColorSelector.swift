struct ColorSelector {
    private let lightColorPalette: ColorPalette
    private let darkColorPalette: ColorPalette

    init(theme: Theme = DesignSystem.shared.currentTheme) {
        lightColorPalette = theme.lightColorPalette
        darkColorPalette = theme.darkColorPalette
    }

    func getFromPalette(color keyPath: KeyPath<PrimaryColorPalette, String>) -> UIColor {
        createColor(
            hexLight: lightColorPalette.primary[keyPath: keyPath],
            hexDark: darkColorPalette.primary[keyPath: keyPath]
        )
    }

    func getFromPalette(color keyPath: KeyPath<SecondaryColorPalette, String>) -> UIColor {
        createColor(
            hexLight: lightColorPalette.secondary[keyPath: keyPath],
            hexDark: darkColorPalette.secondary[keyPath: keyPath]
        )
    }

    func getFromPalette(color keyPath: KeyPath<SurfaceColorPalette, String>) -> UIColor {
        createColor(
            hexLight: lightColorPalette.surface[keyPath: keyPath],
            hexDark: darkColorPalette.surface[keyPath: keyPath]
        )
    }

    func getFromPalette(color keyPath: KeyPath<ContentColorPalette, String>) -> UIColor {
        createColor(
            hexLight: lightColorPalette.content[keyPath: keyPath],
            hexDark: darkColorPalette.content[keyPath: keyPath]
        )
    }

    func getFromPalette(color keyPath: KeyPath<FeedbackColorPalette, String>) -> UIColor {
        createColor(
            hexLight: lightColorPalette.feedback[keyPath: keyPath],
            hexDark: darkColorPalette.feedback[keyPath: keyPath]
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
