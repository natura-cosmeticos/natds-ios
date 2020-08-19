func getTheme() -> Theme {
    validateTheme(from: ConfigurationStorage.shared, fatalError: designSystemFatalError)
}
