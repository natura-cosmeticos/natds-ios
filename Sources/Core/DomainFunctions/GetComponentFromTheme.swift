func getComponentAttributeFromTheme<T>(_ keyPath: KeyPath<Components, T>) -> T {
    getThemeValidated(
        from: ConfigurationStorage.shared,
        fatalError: designSystemFatalError
    ).components[keyPath: keyPath]
}
