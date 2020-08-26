final class ConfigurationStorage {
    var currentTheme: ThemeProtocol?
    var cachedColors: [String: UIColor] = [:]

    private init() {}

    static let shared = ConfigurationStorage()
}
