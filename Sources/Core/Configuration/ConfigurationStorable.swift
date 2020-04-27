protocol ConfigurationStorable: class {
    func save(theme: Theme)
    func getTheme() -> Theme?
}
