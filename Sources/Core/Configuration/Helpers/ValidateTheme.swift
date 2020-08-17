func validateTheme(from storage: ConfigurationStorable, fatalError: () -> Never) -> Theme {
    guard let theme = storage.getTheme() else {
        fatalError()
    }

    return theme
}

func validateThemeProtocol(from storage: ConfigurationStorable, fatalError: () -> Never) -> ThemeProtocol {
    guard let theme = storage.getThemeProtocol() else {
        fatalError()
    }

    return theme
}
