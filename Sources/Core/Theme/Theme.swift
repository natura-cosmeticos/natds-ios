import Foundation

protocol Theme {
    var lightColorPalette: ColorPalette { get }
    var darkColorPalette: ColorPalette { get }
    var spacing: Spacing { get }
}

func getCurrentTheme(
    storage: ConfigurationStorable = ConfigurationStorage.shared,
    fatalError: () -> Never = designSystemFatalError) -> Theme {

    guard let theme = ConfigurationStorage.shared.getTheme() else {
        fatalError()
    }

    return theme
}

func designSystemFatalError() -> Never {
    fatalError("aaa")
}
