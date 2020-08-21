func getUIColorFromTokens(_ keyPath: KeyPath<TokensProtocol, String>) -> UIColor {
    getOrCreatedCachedColor(
        colorHex: getTokenFromTheme(keyPath),
        storage: ConfigurationStorage.shared,
        fatalError: { fatalError("Not a token color") }
    )
}
