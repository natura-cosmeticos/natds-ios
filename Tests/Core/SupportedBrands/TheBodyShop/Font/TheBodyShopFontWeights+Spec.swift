import Quick
import Nimble

@testable import NatDS

final class TheBodyShopFontWeightsSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopFontWeights()

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
        }

        describe("#regular") {
            it("returns a expect value") {
                expect(systemUnderTest.regular).to(equal(.regular))
            }
        }

        describe("#medium") {
            it("returns a expect value") {
                expect(systemUnderTest.medium).to(equal(.medium))
            }
        }
    }
}
