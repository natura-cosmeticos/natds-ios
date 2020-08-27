import Quick
import Nimble

@testable import NatDS

final class NatShortcutWidthsSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatShortcut.Widths.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubThemeProtocol()
        }

        describe("#small") {
            it("returns expected maximum") {
                expect(systemUnderTest.maximum).to(equal(getTokenFromTheme(\.sizeLarge)))
            }
        }
    }
}
