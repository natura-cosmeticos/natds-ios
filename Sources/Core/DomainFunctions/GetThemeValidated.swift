func getThemeValidated(
    from storage: ConfigurationStorage,
    fatalError: () -> Never) -> ThemeProtocol {

    guard let theme = storage.currentTheme else { fatalError() }

    return theme
}
