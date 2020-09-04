import Quick
import Nimble

@testable import NatDS

final class NatIconButtonSizesSpecs: QuickSpec {
    override func spec() {
        let systemUnderTest = NatIconButton.Sizes.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubThemeProtocol()
        }

        describe("#semi") {
            it("returns an expected value") {
                expect(systemUnderTest.semi).to(equal(getTokenFromTheme(\.sizeSemi)))
            }
        }

        describe("#medium") {
            it("returns an expected value") {
                expect(systemUnderTest.semiX).to(equal(getTokenFromTheme(\.sizeSemiX)))
            }
        }
    }
}
