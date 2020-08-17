@testable import NatDS

final class MockStorage: ConfigurationStorable {
    var theme: Theme?
    var themeProtocol: ThemeProtocol?

    var saveThemeInvocations = 0
    var saveThemeProtocolInvocations = 0
    var getThemeInvocations = 0
    var getThemeProtocolInvocations = 0

    func save(theme: Theme) {
        saveThemeInvocations += 1

        self.theme = theme
    }

    func save(theme: ThemeProtocol) {
        self.themeProtocol = theme

        saveThemeProtocolInvocations += 1
    }

    func getTheme() -> Theme? {
        getThemeInvocations += 1

        return theme
    }

    func getThemeProtocol() -> ThemeProtocol? {
        getThemeProtocolInvocations += 1

        return themeProtocol
    }
}
