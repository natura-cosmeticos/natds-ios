func getTokenFromTheme<T>(_ keyPath: KeyPath<TokensProtocol, T>) -> T {
    getThemeValidated(
        from: ConfigurationStorage.shared,
        fatalError: designSystemFatalError
    ).tokens[keyPath: keyPath]
}

func getUIColorFromTokens(_ keyPath: KeyPath<TokensProtocol, String>) -> UIColor {
    getOrCreatedCachedColor(
        colorHex: getTokenFromTheme(keyPath),
        storage: ConfigurationStorage.shared,
        fatalError: { fatalError("Not a token color") }
    )
}

func getOrCreatedCachedColor(
    colorHex: String,
    storage: ConfigurationStorage,
    fatalError: () -> Never) -> UIColor {

    if let color = storage.cachedColors[colorHex] {
        return color
    }

    guard let color = UIColor(hex: colorHex) else { fatalError() }

    storage.cachedColors[colorHex] = color

    return color
}
