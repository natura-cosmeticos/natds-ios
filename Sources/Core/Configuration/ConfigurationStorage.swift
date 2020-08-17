final class ConfigurationStorage: ConfigurationStorable {
    private var theme: Theme?
    private var themeProtocol: ThemeProtocol?

    private init() {}

    static let shared = ConfigurationStorage()

    func save(theme: Theme) {
        self.theme = theme
    }

    func save(theme: ThemeProtocol) {
        self.themeProtocol = theme
    }

    func getTheme() -> Theme? {
        theme
    }

    func getThemeProtocol() -> ThemeProtocol? {
        themeProtocol
    }
}
