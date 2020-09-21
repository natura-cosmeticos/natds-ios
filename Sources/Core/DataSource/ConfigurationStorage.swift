final class ConfigurationStorage {
    var currentTheme: Theme?
    var cachedColors: [String: UIColor] = [:]

    private init() {}

    static let shared = ConfigurationStorage()
}
