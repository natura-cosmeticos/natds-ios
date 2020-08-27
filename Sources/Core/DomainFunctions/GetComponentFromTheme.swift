func getComponentAttributeFromTheme<T>(_ keyPath: KeyPath<ComponentsProtocol, T>) -> T {
    getThemeValidated(
        from: ConfigurationStorage.shared,
        fatalError: designSystemFatalError
    ).components[keyPath: keyPath]
}
