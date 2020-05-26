import Quick
import Nimble

@testable import NatDS

final class AvonFontSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonFont()

        beforeEach {
            DesignSystem().configure(with: .natura)
        }

        describe("#sizes") {
            it("returns a instance of AvonFontSizes") {
                expect(systemUnderTest.sizes).to(beAnInstanceOf(AvonFontSizes.self))
            }
        }

        describe("#weights") {
            it("returns a instance of AvonFontWeights") {
                expect(systemUnderTest.weights).to(beAnInstanceOf(AvonFontWeights.self))
            }
        }

        describe("#letterSpacings") {
            it("returns a instance of AvonFontLetterSpacings") {
                expect(systemUnderTest.letterSpacings).to(beAnInstanceOf(AvonFontLetterSpacings.self))
            }
        }
    }
}
