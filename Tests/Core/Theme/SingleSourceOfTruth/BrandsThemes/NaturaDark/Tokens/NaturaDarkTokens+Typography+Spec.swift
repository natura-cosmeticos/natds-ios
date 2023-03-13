import Quick
import Nimble

@testable import NatDS

final class NaturaDarkTokensTypographySpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaDarkTheme().tokens

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
                expect(systemUnderTest.typographyFontFamilyBranding).to(equal("Roboto"))
            }
        }

        describe("#typographyFontFamilyCode") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyFontFamilyCode).to(equal("SF Mono"))
                }
        }

        describe("#typographyDisplayFontFamily") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyDisplayFontFamily).to(equal("Helvetica Now Display"))
                }
        }

        describe("#typographyHeadlineFontFamily") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyHeadlineFontFamily).to(equal("Helvetica Now Display"))
                }
        }

        describe("#typographyBodyRegularFontFamily") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyBodyRegularFontFamily).to(equal("Helvetica Now Display"))
                }
        }

        describe("#typographyBodyBoldFontFamily") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyBodyBoldFontFamily).to(equal("Helvetica Now Display"))
                }
        }

        describe("#typographyFallbackFontFamily") {
            it("returns an expected value") {
                expect(systemUnderTest.typographyFallbackFontFamily).to(equal("San Francisco"))
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
