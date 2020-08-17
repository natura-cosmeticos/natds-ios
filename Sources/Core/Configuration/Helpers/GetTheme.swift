func getTheme() -> Theme {
    validateTheme(from: ConfigurationStorage.shared, fatalError: designSystemFatalError)
}

func getFromTheme<T>(_ keyPath: KeyPath<TokensProtocol, T>) -> T {
    validateThemeProtocol(
        from: ConfigurationStorage.shared,
        fatalError: designSystemFatalError
    ).tokens[keyPath: keyPath]
}

func getFromTheme<T>(_ keyPath: KeyPath<ComponentsProtocol, T>) -> T {
    validateThemeProtocol(
        from: ConfigurationStorage.shared,
        fatalError: designSystemFatalError
    ).components[keyPath: keyPath]
}
