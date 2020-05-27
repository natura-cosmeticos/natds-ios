import Quick
import Nimble

@testable import NatDS

final class NatFontsKernSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatFonts.Kern.self

        context("when using Avon as theme") {
            let expectedLetterSpacings = AvonFontLetterSpacings()

            beforeEach {
                DesignSystem().configure(with: .avon)
            }

            describe("#heading1") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading1).to(equal(expectedLetterSpacings.heading1))
                }
            }

            describe("#heading2") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading2).to(equal(expectedLetterSpacings.heading2))
                }
            }

            describe("#heading3") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading3).to(equal(expectedLetterSpacings.heading3))
                }
            }

            describe("#heading4") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading4).to(equal(expectedLetterSpacings.heading4))
                }
            }

            describe("#heading5") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading5).to(equal(expectedLetterSpacings.heading5))
                }
            }

            describe("#heading6") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading6).to(equal(expectedLetterSpacings.heading6))
                }
            }

            describe("#subtitle1") {
                it("returns a expect value") {
                    expect(systemUnderTest.subtitle1).to(equal(expectedLetterSpacings.subtitle1))
                }
            }

            describe("#subtitle2") {
                it("returns a expect value") {
                    expect(systemUnderTest.subtitle2).to(equal(expectedLetterSpacings.subtitle2))
                }
            }

            describe("#body1") {
                it("returns a expect value") {
                    expect(systemUnderTest.body1).to(equal(expectedLetterSpacings.body1))
                }
            }

            describe("#body2") {
                it("returns a expect value") {
                    expect(systemUnderTest.body2).to(equal(expectedLetterSpacings.body2))
                }
            }

            describe("#button") {
                it("returns a expect value") {
                    expect(systemUnderTest.button).to(equal(expectedLetterSpacings.button))
                }
            }

            describe("#caption") {
                it("returns a expect value") {
                    expect(systemUnderTest.caption).to(equal(expectedLetterSpacings.caption))
                }
            }

            describe("#overline") {
                it("returns a expect value") {
                    expect(systemUnderTest.overline).to(equal(expectedLetterSpacings.overline))
                }
            }

        } // context - when using Avon as theme

        context("when using Natura as theme") {
            let expectedLetterSpacings = NaturaFontLetterSpacings()

            beforeEach {
                DesignSystem().configure(with: .natura)
            }

            describe("#heading1") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading1).to(equal(expectedLetterSpacings.heading1))
                }
            }

            describe("#heading2") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading2).to(equal(expectedLetterSpacings.heading2))
                }
            }

            describe("#heading3") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading3).to(equal(expectedLetterSpacings.heading3))
                }
            }

            describe("#heading4") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading4).to(equal(expectedLetterSpacings.heading4))
                }
            }

            describe("#heading5") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading5).to(equal(expectedLetterSpacings.heading5))
                }
            }

            describe("#heading6") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading6).to(equal(expectedLetterSpacings.heading6))
                }
            }

            describe("#subtitle1") {
                it("returns a expect value") {
                    expect(systemUnderTest.subtitle1).to(equal(expectedLetterSpacings.subtitle1))
                }
            }

            describe("#subtitle2") {
                it("returns a expect value") {
                    expect(systemUnderTest.subtitle2).to(equal(expectedLetterSpacings.subtitle2))
                }
            }

            describe("#body1") {
                it("returns a expect value") {
                    expect(systemUnderTest.body1).to(equal(expectedLetterSpacings.body1))
                }
            }

            describe("#body2") {
                it("returns a expect value") {
                    expect(systemUnderTest.body2).to(equal(expectedLetterSpacings.body2))
                }
            }

            describe("#button") {
                it("returns a expect value") {
                    expect(systemUnderTest.button).to(equal(expectedLetterSpacings.button))
                }
            }

            describe("#caption") {
                it("returns a expect value") {
                    expect(systemUnderTest.caption).to(equal(expectedLetterSpacings.caption))
                }
            }

            describe("#overline") {
                it("returns a expect value") {
                    expect(systemUnderTest.overline).to(equal(expectedLetterSpacings.overline))
                }
            }

        } // context - when using Natura as theme

        context("when using The Body Shop as theme") {
            let expectedLetterSpacings = TheBodyShopFontLetterSpacings()

            beforeEach {
                DesignSystem().configure(with: .natura)
            }

            describe("#heading1") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading1).to(equal(expectedLetterSpacings.heading1))
                }
            }

            describe("#heading2") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading2).to(equal(expectedLetterSpacings.heading2))
                }
            }

            describe("#heading3") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading3).to(equal(expectedLetterSpacings.heading3))
                }
            }

            describe("#heading4") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading4).to(equal(expectedLetterSpacings.heading4))
                }
            }

            describe("#heading5") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading5).to(equal(expectedLetterSpacings.heading5))
                }
            }

            describe("#heading6") {
                it("returns a expect value") {
                    expect(systemUnderTest.heading6).to(equal(expectedLetterSpacings.heading6))
                }
            }

            describe("#subtitle1") {
                it("returns a expect value") {
                    expect(systemUnderTest.subtitle1).to(equal(expectedLetterSpacings.subtitle1))
                }
            }

            describe("#subtitle2") {
                it("returns a expect value") {
                    expect(systemUnderTest.subtitle2).to(equal(expectedLetterSpacings.subtitle2))
                }
            }

            describe("#body1") {
                it("returns a expect value") {
                    expect(systemUnderTest.body1).to(equal(expectedLetterSpacings.body1))
                }
            }

            describe("#body2") {
                it("returns a expect value") {
                    expect(systemUnderTest.body2).to(equal(expectedLetterSpacings.body2))
                }
            }

            describe("#button") {
                it("returns a expect value") {
                    expect(systemUnderTest.button).to(equal(expectedLetterSpacings.button))
                }
            }

            describe("#caption") {
                it("returns a expect value") {
                    expect(systemUnderTest.caption).to(equal(expectedLetterSpacings.caption))
                }
            }

            describe("#overline") {
                it("returns a expect value") {
                    expect(systemUnderTest.overline).to(equal(expectedLetterSpacings.overline))
                }
            }

        } // context - when using The Body Shop as theme
    }
}
