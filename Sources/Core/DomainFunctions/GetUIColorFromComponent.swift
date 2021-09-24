func getUIColorFromComponentAttributes(_ keyPath: KeyPath<Components, String>) -> UIColor {
    getOrCreatedCachedColor(
        colorHex: getComponentAttributeFromTheme(keyPath),
        storage: ConfigurationStorage.shared,
        fatalError: { fatalError("Not a token color") }
    )
}
