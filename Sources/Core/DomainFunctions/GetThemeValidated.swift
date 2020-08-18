func getThemeValidated(from storage: ConfigurationStorable, fatalError: () -> Never) -> ThemeProtocol {
    guard let theme = storage.getThemeProtocol() else {
        fatalError()
    }

    return theme
}
