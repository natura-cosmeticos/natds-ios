import Quick
import Nimble

@testable import NatDS

final class NaturaBorderRadiusSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaBorderRadius()

        describe("#small") {
            it("returns a expect value") {
                expect(systemUnderTest.small).to(equal(2))
            }
        }

        describe("#medium") {
            it("returns a expect value") {
                expect(systemUnderTest.medium).to(equal(4))
            }
        }

        describe("#large") {
            it("returns a expect value") {
                expect(systemUnderTest.large).to(equal(8))
            }
        }

        describe("#standart") {
            it("returns a expect value") {
                expect(systemUnderTest.circle(viewHeight: 2)).to(equal(1))
            }

            it("returns a expect value") {
                expect(systemUnderTest.circle(viewHeight: 1)).to(equal(0.5))
            }
        }
    }
}
