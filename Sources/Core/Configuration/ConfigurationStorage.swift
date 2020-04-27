final class ConfigurationStorage: ConfigurationStorable {
    private var theme: Theme?

    private init() {}

    static let shared = ConfigurationStorage()

    func save(theme: Theme) {
        self.theme = theme
    }

    func getTheme() -> Theme? {
        theme
    }
}
