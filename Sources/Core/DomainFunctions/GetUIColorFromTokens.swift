func getUIColorFromTokens(_ keyPath: KeyPath<Tokens, String>) -> UIColor {
    getOrCreatedCachedColor(
        colorHex: getTokenFromTheme(keyPath),
        storage: ConfigurationStorage.shared,
        fatalError: { fatalError("Not a token color") }
    )
}
