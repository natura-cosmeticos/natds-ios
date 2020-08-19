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
                expect(systemUnderTest.small).to(equal(getTokenFromTheme(\.sizeSemi)))
            }
        }

        describe("#medium") {
            it("returns expected height") {
                expect(systemUnderTest.medium).to(equal(getTokenFromTheme(\.sizeSemiX)))
            }
        }

        describe("#large") {
            it("returns expected height") {
                expect(systemUnderTest.large).to(equal(getTokenFromTheme(\.sizeMedium)))
            }
        }
    }
}
