protocol ConfigurationStorable: class {
    // will be removed.
    func save(theme: Theme)
    func save(theme: ThemeProtocol)
    // will be removed.
    func getTheme() -> Theme?
    func getThemeProtocol() -> ThemeProtocol?
}
