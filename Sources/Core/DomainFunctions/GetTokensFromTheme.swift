func getTokenFromTheme<T>(_ keyPath: KeyPath<TokensProtocol, T>) -> T {
    getThemeValidated(
        from: ConfigurationStorage.shared,
        fatalError: designSystemFatalError
    ).tokens[keyPath: keyPath]
}
