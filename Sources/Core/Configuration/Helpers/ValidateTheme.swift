func validateTheme(from storage: ConfigurationStorable, fatalError: () -> Never) -> Theme {
    guard let theme = ConfigurationStorage.shared.getTheme() else {
        fatalError()
    }

    return theme
}
