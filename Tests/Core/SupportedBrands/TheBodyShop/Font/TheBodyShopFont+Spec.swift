import Quick
import Nimble

@testable import NatDS

final class TheBodyShopFontSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopFont()

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
        }

        describe("#sizes") {
            it("returns a instance of TheBodyShopFontSizes") {
                expect(systemUnderTest.sizes).to(beAnInstanceOf(TheBodyShopFontSizes.self))
            }
        }

        describe("#weights") {
            it("returns a instance of TheBodyShopFontWeights") {
                expect(systemUnderTest.weights).to(beAnInstanceOf(TheBodyShopFontWeights.self))
            }
        }
    }
}
