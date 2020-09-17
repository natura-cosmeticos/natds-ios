import Quick
import Nimble

@testable import NatDS

final class NatBadgeColorSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatBadge.Color.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }

        describe("#alert") {
            it("returns expected color for box") {
                expect(systemUnderTest.alert.box).to(equal(getUIColorFromTokens(\.colorAlert)))
            }

            it("returns expected color for content") {
                expect(systemUnderTest.alert.content).to(equal(getUIColorFromTokens(\.colorOnAlert)))
            }
        }
    }
}
