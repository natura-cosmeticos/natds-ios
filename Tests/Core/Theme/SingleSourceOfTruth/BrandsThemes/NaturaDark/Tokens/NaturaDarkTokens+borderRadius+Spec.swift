import Quick
import Nimble

@testable import NatDS

final class NaturaDarkTokensBorderRadiusSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaDarkTheme().tokens

        describe("#borderRadiusNone") {
            it("returns an expected value") {
                expect(systemUnderTest.borderRadiusNone).to(equal(0))
            }

            describe("#borderRadiusSmall") {
                it("returns an expected value") {
                    expect(systemUnderTest.borderRadiusSmall).to(equal(2))
                }
            }

            describe("#borderRadiusMedium") {
                it("returns an expected value") {
                    expect(systemUnderTest.borderRadiusMedium).to(equal(4))
                }
            }

            describe("#borderRadiusLarge") {
                it("returns an expected value") {
                    expect(systemUnderTest.borderRadiusLarge).to(equal(8))
                }
            }
        }
    }
}
