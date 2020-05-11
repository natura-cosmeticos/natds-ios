import Quick
import Nimble

@testable import NatDS

final class NaturaFontWeightsSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaFontWeights()

        beforeEach {
            DesignSystem().configure(with: .natura)
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
