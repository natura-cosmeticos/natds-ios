import Quick
import Nimble

@testable import NatDS

final class NatCounterSizeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatCounter.Size.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }

        describe("#semi") {
            it("returns expected height") {
                expect(systemUnderTest.semi.value).to(equal(getTokenFromTheme(\.sizeSemi)))
            }
        }

        describe("#medium") {
            it("returns expected height") {
                expect(systemUnderTest.medium.value).to(equal(getTokenFromTheme(\.sizeMedium)))
            }
        }
    }
}
