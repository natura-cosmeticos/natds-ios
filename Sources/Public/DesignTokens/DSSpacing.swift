import Foundation

struct DSSpacing {
    static var micro: CGFloat { getCurrentTheme().spacing.micro }
    static var tiny: CGFloat { getCurrentTheme().spacing.tiny }
    static var small: CGFloat { getCurrentTheme().spacing.small }
    static var semi: CGFloat { getCurrentTheme().spacing.semi }
    static var large: CGFloat { getCurrentTheme().spacing.large }
    static var xLarge: CGFloat { getCurrentTheme().spacing.xLarge }
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
