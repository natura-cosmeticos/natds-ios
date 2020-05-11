import Quick
import Nimble

@testable import NatDS

final class AvonFontWeightsSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonFontWeights()

        beforeEach {
            DesignSystem().configure(with: .avon)
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
