import Quick
import Nimble

@testable import NatDS

final class NaturaFontSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaFont()

        beforeEach {
            DesignSystem().configure(with: .natura)
        }

        describe("#sizes") {
            it("returns a instance of NaturaFontSizes") {
                expect(systemUnderTest.sizes).to(beAnInstanceOf(NaturaFontSizes.self))
            }
        }

        describe("#weights") {
            it("returns a instance of NaturaFontWeights") {
                expect(systemUnderTest.weights).to(beAnInstanceOf(NaturaFontWeights.self))
            }
        }
    }
}
