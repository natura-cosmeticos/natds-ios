func getThemeValidated(
    from storage: ConfigurationStorage,
    fatalError: () -> Never) -> Theme {

    guard let theme = storage.currentTheme else { fatalError() }

    return theme
}
