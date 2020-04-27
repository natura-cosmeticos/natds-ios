@testable import NatDS

final class MockStorage: ConfigurationStorable {
    var theme: Theme?
    var saveInvocations = 0
    var getThemeInvocations = 0

    func save(theme: Theme) {
        self.theme = theme

        saveInvocations += 1
    }

    func getTheme() -> Theme? {
        getThemeInvocations += 1

        return theme
    }
}
