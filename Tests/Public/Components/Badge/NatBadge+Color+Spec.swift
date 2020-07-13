import Quick
import Nimble

@testable import NatDS

final class NatBadgeColorSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatBadge.Color.self

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
        }

        describe("#alert") {
            it("returns expected color for box") {
                expect(systemUnderTest.alert.box).to(equal(getTheme().colors.alert))
            }

            it("returns expected color for content") {
                expect(systemUnderTest.alert.content).to(equal(getTheme().colors.onAlert))
            }
        }
    }
}
