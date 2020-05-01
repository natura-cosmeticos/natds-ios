func getCurrentTheme(
    storage: ConfigurationStorable = ConfigurationStorage.shared,
    fatalError: () -> Never = designSystemFatalError) -> Theme {

    guard let theme = ConfigurationStorage.shared.getTheme() else {
        fatalError()
    }

    return theme
}

func designSystemFatalError() -> Never {
    fatalError("DesignSystem ERROR - DesignSystem.shared.configure(with: Brand) needed!!!!")
}
