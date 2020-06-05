import Quick
import Nimble

@testable import NatDS

final class NatButtonHeightSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatButton.Height.self

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
        }

        describe("#small") {
            it("returns expected height") {
                expect(systemUnderTest.small).to(equal(getTheme().sizes.semi))
            }
        }

        describe("#medium") {
            it("returns expected height") {
                expect(systemUnderTest.medium).to(equal(getTheme().sizes.semix))
            }
        }

        describe("#large") {
            it("returns expected height") {
                expect(systemUnderTest.large).to(equal(getTheme().sizes.medium))
            }
        }
    }
}
