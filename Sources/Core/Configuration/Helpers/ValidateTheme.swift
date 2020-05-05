func validateTheme(from storage: ConfigurationStorable, fatalError: () -> Never) -> Theme {
    guard let theme = storage.getTheme() else {
        fatalError()
    }

    return theme
}
