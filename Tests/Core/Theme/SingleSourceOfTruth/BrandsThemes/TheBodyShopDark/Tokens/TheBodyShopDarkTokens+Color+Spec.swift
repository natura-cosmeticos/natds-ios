import Quick
import Nimble

@testable import NatDS

final class TheBodyShopDarkTokensColorSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopDarkTheme().tokens

        describe("#colorPrimary") {
            it("returns an expected value") {
                expect(systemUnderTest.colorPrimary).to(equal("#7CC4BC"))
            }
        }

        describe("#colorOnPrimary") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnPrimary).to(equal("#000000"))
            }
        }

        describe("#colorPrimaryLight") {
            it("returns an expected value") {
                expect(systemUnderTest.colorPrimaryLight).to(equal("#AEF7EE"))
            }
        }

        describe("#colorOnPrimaryLight") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnPrimaryLight).to(equal("#000000"))
            }
        }

        describe("#colorPrimaryDark") {
            it("returns an expected value") {
                expect(systemUnderTest.colorPrimaryDark).to(equal("#4C938C"))
            }
        }

        describe("#colorOnPrimaryDark") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnPrimaryDark).to(equal("#000000"))
            }
        }

        describe("#colorSecondary") {
            it("returns an expected value") {
                expect(systemUnderTest.colorSecondary).to(equal("#F3F1A5"))
            }
        }

        describe("#colorOnSecondary") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnSecondary).to(equal("#000000"))
            }
        }

        describe("#colorSecondaryLight") {
            it("returns an expected value") {
                expect(systemUnderTest.colorSecondaryLight).to(equal("#FFFFD7"))
            }
        }

        describe("#colorOnSecondaryLight") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnSecondaryLight).to(equal("#000000"))
            }
        }

        describe("#colorSecondaryDark") {
            it("returns an expected value") {
                expect(systemUnderTest.colorSecondaryDark).to(equal("#BFBF75"))
            }
        }

        describe("#colorOnSecondaryDark") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnSecondaryDark).to(equal("#000000"))
            }
        }

        describe("#colorBackground") {
            it("returns an expected value") {
                expect(systemUnderTest.colorBackground).to(equal("#121212"))
            }
        }

        describe("#colorOnBackground") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnBackground).to(equal("#FFFFFF"))
            }
        }

        describe("#colorSurface") {
            it("returns an expected value") {
                expect(systemUnderTest.colorSurface).to(equal("#333333"))
            }
        }

        describe("#colorOnSurface") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnSurface).to(equal("#FFFFFF"))
            }
        }

        describe("#colorHighlight") {
            it("returns an expected value") {
                expect(systemUnderTest.colorHighlight).to(equal("#FFFFFF"))
            }
        }

        describe("#colorHighEmphasis") {
            it("returns an expected value") {
                expect(systemUnderTest.colorHighEmphasis).to(equal("#FAFAFA"))
            }
        }

        describe("#colorMediumEmphasis") {
            it("returns an expected value") {
                expect(systemUnderTest.colorMediumEmphasis).to(equal("#BBBBBB"))
            }
        }

        describe("#colorLowEmphasis") {
            it("returns an expected value") {
                expect(systemUnderTest.colorLowEmphasis).to(equal("#777777"))
            }
        }

        describe("#colorLink") {
            it("returns an expected value") {
                expect(systemUnderTest.colorLink).to(equal("#227BBD"))
            }
        }

        describe("#colorOnLink") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnLink).to(equal("#FFFFFF"))
            }
        }

        describe("#colorSuccess") {
            it("returns an expected value") {
                expect(systemUnderTest.colorSuccess).to(equal("#569A32"))
            }
        }

        describe("#colorOnSuccess") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnSuccess).to(equal("#FFFFFF"))
            }
        }

        describe("#colorWarning") {
            it("returns an expected value") {
                expect(systemUnderTest.colorWarning).to(equal("#FCC433"))
            }
        }

        describe("#colorOnWarning") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnWarning).to(equal("#333333"))
            }
        }

        describe("#colorAlert") {
            it("returns an expected value") {
                expect(systemUnderTest.colorAlert).to(equal("#E74627"))
            }
        }

        describe("#colorOnAlert") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnAlert).to(equal("#FFFFFF"))
            }
        }
    }
}
