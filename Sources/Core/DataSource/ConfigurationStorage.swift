final class ConfigurationStorage: ConfigurationStorable {
    private var theme: Theme?
    var currentTheme: ThemeProtocol?
    var cachedColors: [String: UIColor] = [:]

    private init() {}

    static let shared = ConfigurationStorage()

    func save(theme: Theme) {
        self.theme = theme
    }

    func getTheme() -> Theme? {
        theme
    }
}
