import Quick
import Nimble

@testable import NatDS

final class AesopDarkTokensOpacitySpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AesopDarkTheme().tokens

        describe("#opacityTransparent") {
            it("returns an expected value") {
                expect(systemUnderTest.opacityTransparent).to(equal(0))
            }
        }

        describe("#opacityLower") {
            it("returns an expected value") {
                expect(systemUnderTest.opacityLower).to(equal(0.04))
            }
        }

        describe("#opacityVeryLow") {
            it("returns an expected value") {
                expect(systemUnderTest.opacityVeryLow).to(equal(0.08))
            }
        }

        describe("#opacityLow") {
            it("returns an expected value") {
                expect(systemUnderTest.opacityLow).to(equal(0.12))
            }
        }

        describe("#opacityMediumLow") {
            it("returns an expected value") {
                expect(systemUnderTest.opacityMediumLow).to(equal(0.16))
            }
        }

        describe("#opacityDisabledLow") {
            it("returns an expected value") {
                expect(systemUnderTest.opacityDisabledLow).to(equal(0.24))
            }
        }

        describe("#opacityDisabled") {
            it("returns an expected value") {
                expect(systemUnderTest.opacityDisabled).to(equal(0.32))
            }
        }

        describe("#opacityMedium") {
            it("returns an expected value") {
                expect(systemUnderTest.opacityMedium).to(equal(0.48))
            }
        }

        describe("#opacityMediumHigh") {
            it("returns an expected value") {
                expect(systemUnderTest.opacityMediumHigh).to(equal(0.56))
            }
        }

        describe("#opacityHigh") {
            it("returns an expected value") {
                expect(systemUnderTest.opacityHigh).to(equal(0.64))
            }
        }

        describe("#opacityVeryHigh") {
            it("returns an expected value") {
                expect(systemUnderTest.opacityVeryHigh).to(equal(0.8))
            }
        }

        describe("#opacityOpaque") {
            it("returns an expected value") {
                expect(systemUnderTest.opacityOpaque).to(equal(1))
            }
        }
    }
}
