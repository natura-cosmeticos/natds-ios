protocol ConfigurationStorable: class {
    func save(_ theme: Theme)
    func getTheme() -> Theme?
}
