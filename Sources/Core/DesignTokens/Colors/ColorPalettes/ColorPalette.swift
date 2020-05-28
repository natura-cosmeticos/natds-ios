protocol ColorPalette {
    var primary: PrimaryColorPalette { get }
    var secondary: SecondaryColorPalette { get }
    var surface: SurfaceColorPalette { get }
    var content: ContentColorPalette { get }
    var feedback: FeedbackColorPalette { get }
}

protocol ColorPalette2 {
    var primary: String { get }
    var onPrimary: String { get }
    var primaryLight: String { get }
    var onPrimaryLight: String { get }
    var primaryDark: String { get }
    var onPrimaryDark: String { get }
    var secondary: String { get }
    var onSecondary: String { get }
    var secondaryLight: String { get }
    var onSecondaryLight: String { get }
    var secondaryDark: String { get }
    var onSecondaryDark: String { get }
    var background: String { get }
    var onBackground: String { get }
    var surface: String { get }
    var onSurface: String { get }
    var highlight: String { get }
    var highEmphasis: String { get }
    var mediumEmphasis: String { get }
    var lowEmphasis: String { get }
    var success: String { get }
    var onSuccess: String { get }
    var warning: String { get }
    var onWarning: String { get }
    var alert: String { get }
    var onAlert: String { get }
    var link: String { get }
    var onLink: String { get }
}

class Colors2 {
    private let colorSelector: ColorSelector2

    init(colorSelector: ColorSelector2) {
        self.colorSelector = colorSelector
    }

    lazy var primary: UIColor = colorSelector.getFromPalette(color: \.primary)
    lazy var onPrimary: UIColor = colorSelector.getFromPalette(color: \.onPrimary)
    lazy var primaryLight: UIColor = colorSelector.getFromPalette(color: \.primaryLight)
    lazy var onPrimaryLight: UIColor = colorSelector.getFromPalette(color: \.onPrimaryLight)
    lazy var primaryDark: UIColor = colorSelector.getFromPalette(color: \.primaryDark)
    lazy var onPrimaryDark: UIColor = colorSelector.getFromPalette(color: \.onPrimaryDark)
    lazy var secondary: UIColor = colorSelector.getFromPalette(color: \.secondary)
    lazy var onSecondary: UIColor = colorSelector.getFromPalette(color: \.onSecondary)
    lazy var secondaryLight: UIColor = colorSelector.getFromPalette(color: \.secondaryLight)
    lazy var onSecondaryLight: UIColor = colorSelector.getFromPalette(color: \.onSecondaryLight)
    lazy var secondaryDark: UIColor = colorSelector.getFromPalette(color: \.secondaryDark)
    lazy var onSecondaryDark: UIColor = colorSelector.getFromPalette(color: \.onSecondaryDark)
    lazy var background: UIColor = colorSelector.getFromPalette(color: \.background)
    lazy var onBackground: UIColor = colorSelector.getFromPalette(color: \.onBackground)
    lazy var surface: UIColor = colorSelector.getFromPalette(color: \.surface)
    lazy var onSurface: UIColor = colorSelector.getFromPalette(color: \.onSurface)
    lazy var highlight: UIColor = colorSelector.getFromPalette(color: \.highlight)
    lazy var highEmphasis: UIColor = colorSelector.getFromPalette(color: \.highEmphasis)
    lazy var mediumEmphasis: UIColor = colorSelector.getFromPalette(color: \.mediumEmphasis)
    lazy var lowEmphasis: UIColor = colorSelector.getFromPalette(color: \.lowEmphasis)
    lazy var success: UIColor = colorSelector.getFromPalette(color: \.success)
    lazy var onSuccess: UIColor = colorSelector.getFromPalette(color: \.onSuccess)
    lazy var warning: UIColor = colorSelector.getFromPalette(color: \.warning)
    lazy var onWarning: UIColor = colorSelector.getFromPalette(color: \.onWarning)
    lazy var alert: UIColor = colorSelector.getFromPalette(color: \.alert)
    lazy var onAlert: UIColor = colorSelector.getFromPalette(color: \.onAlert)
    lazy var link: UIColor = colorSelector.getFromPalette(color: \.link)
    lazy var onLink: UIColor = colorSelector.getFromPalette(color: \.onLink)
}

struct ColorSelector2 {
    private let lightColorPalette: ColorPalette2
    private let darkColorPalette: ColorPalette2

    init(lightColorPalette: ColorPalette2, darkColorPalette: ColorPalette2) {
        self.lightColorPalette = lightColorPalette
        self.darkColorPalette = darkColorPalette
    }

    func getFromPalette(color keyPath: KeyPath<ColorPalette2, String>) -> UIColor {
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
