import Quick
import Nimble

@testable import NatDS

final class NaturaLightTokensSpacingSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaLightTheme().tokens

        describe("#spacingNone") {
            it("returns an expected value") {
                expect(systemUnderTest.spacingNone).to(equal(0))
            }
        }

        describe("#spacingMicro") {
            it("returns an expected value") {
                expect(systemUnderTest.spacingMicro).to(equal(4))
            }
        }

        describe("#spacingTiny") {
            it("returns an expected value") {
                expect(systemUnderTest.spacingTiny).to(equal(8))
            }
        }

        describe("#spacingSmall") {
            it("returns an expected value") {
                expect(systemUnderTest.spacingSmall).to(equal(16))
            }
        }

        describe("#spacingStandard") {
            it("returns an expected value") {
                expect(systemUnderTest.spacingStandard).to(equal(24))
            }
        }

        describe("#spacingSemi") {
            it("returns an expected value") {
                expect(systemUnderTest.spacingSemi).to(equal(32))
            }
        }

        describe("#spacingLarge") {
            it("returns an expected value") {
                expect(systemUnderTest.spacingLarge).to(equal(48))
            }
        }

        describe("#spacingXLarge") {
            it("returns an expected value") {
                expect(systemUnderTest.spacingXLarge).to(equal(64))
            }
        }
    }
}
