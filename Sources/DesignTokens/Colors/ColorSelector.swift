struct ColorSelector {
    private let lightColorPallet: ColorPalette
    private let darkColorPallet: ColorPalette
    
    init(theme: Theme = DesignSystem.shared.currentTheme) {
        lightColorPallet = theme.lightColorPallet
        darkColorPallet = theme.darkColorPallet
    }
    
    func getFromPalette(color keyPath: KeyPath<PrimaryColorPalette , String>)  -> UIColor {
        createColor(
            hexLight: lightColorPallet.primary[keyPath: keyPath],
            hexDark: darkColorPallet.primary[keyPath: keyPath]
        )
    }

    func getFromPalette(color keyPath: KeyPath<SecondaryColorPalette, String>)  -> UIColor {
        createColor(
            hexLight: lightColorPallet.secundary[keyPath: keyPath],
            hexDark: darkColorPallet.secundary[keyPath: keyPath]
        )
    }

    func getFromPalette(color keyPath: KeyPath<SurfaceColorPalette, String>)  -> UIColor {
        createColor(
            hexLight: lightColorPallet.surface[keyPath: keyPath],
            hexDark: darkColorPallet.surface[keyPath: keyPath]
        )
    }

    func getFromPalette(color keyPath: KeyPath<ContentColorPalette, String>) -> UIColor {
        createColor(
            hexLight: lightColorPallet.content[keyPath: keyPath],
            hexDark: darkColorPallet.content[keyPath: keyPath]
        )
    }

    func getFromPalette(color keyPath: KeyPath<FeedbackColorPalette, String>) -> UIColor {
        createColor(
            hexLight: lightColorPallet.feedback[keyPath: keyPath],
            hexDark: darkColorPallet.feedback[keyPath: keyPath]
        )
    }
    
    private func createColor(hexLight: String, hexDark: String) -> UIColor {
        if #available(iOS 13.0, *) {
            return .init { (UITraitCollection) -> UIColor in
                UITraitCollection.userInterfaceStyle == .dark ?
                    .hexColorOrDefault(hexLight)  :
                    .hexColorOrDefault(hexDark)
            }
        } else {
            return .hexColorOrDefault(hexLight)
        }
    }
}
