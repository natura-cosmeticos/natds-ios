import Quick
import Nimble

@testable import NatDS

final class NaturaLightTokensTypographySpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaLightTheme().tokens

        describe("#typographyFontFamilyPrimary") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyFontFamilyPrimary).to(equal("San Francisco"))
            }
        }

        describe("#typographyFontFamilySecondary") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyFontFamilySecondary).to(equal("sans-serif"))
            }
        }

        describe("#typographyFontFamilyBranding") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyFontFamilyBranding).to(equal("Helvetica Now"))
            }
        }

        describe("#typographyFontFamilyCode") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyFontFamilyCode).to(equal("SF Mono"))
                }
        }

        describe("#typographyLineHeightReset") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyLineHeightReset).to(equal(1))
            }
        }

        describe("#typographyLineHeightSmall") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyLineHeightSmall).to(equal(1.25))
            }
        }

        describe("#typographyLineHeightMedium") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyLineHeightMedium).to(equal(1.5))
            }
        }

        describe("#typographyLineHeightLarge") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyLineHeightLarge).to(equal(2))
            }
        }

        describe("#typographyFontWeightRegular") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyFontWeightRegular).to(equal(.regular))
            }
        }

        describe("#typographyFontWeightMedium") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyFontWeightMedium).to(equal(.medium))
            }
        }
    }
}
