import Quick
import Nimble

@testable import NatDS

final class NatIconButtonSizesSpecs: QuickSpec {
    override func spec() {
        let systemUnderTest = NatIconButton.Sizes.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }

        describe("#semi") {
            it("returns an expected value") {
                expect(systemUnderTest.semi.value).to(equal(getTokenFromTheme(\.sizeSemi)))
            }
        }

        describe("#semiX") {
            it("returns an expected value") {
                expect(systemUnderTest.semiX.value).to(equal(getTokenFromTheme(\.sizeSemiX)))
            }
        }

        describe("#medium") {
            it("returns an expected value") {
                expect(systemUnderTest.medium.value).to(equal(getTokenFromTheme(\.sizeMedium)))
            }
        }
    }
}
