func getTokenFromTheme<T>(_ keyPath: KeyPath<Tokens, T>) -> T {
    getThemeValidated(
        from: ConfigurationStorage.shared,
        fatalError: designSystemFatalError
    ).tokens[keyPath: keyPath]
}
