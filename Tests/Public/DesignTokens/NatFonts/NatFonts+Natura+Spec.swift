import Quick
import Nimble

@testable import NatDS

final class NatFontsNaturaSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatFonts.self
        let expectedSizes = NaturaFontSizes()
        let expectedWights = NaturaFontWeights()
        var font: UIFont!

        beforeEach {
            DesignSystem().configure(with: .natura)
        }

        describe("#font") {
            context("when weight is .regular") {
                context("when size is heading1") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading1, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.heading1))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }

                context("when size is heading2") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading2, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.heading2))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }

                context("when size is heading3") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading3, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.heading3))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }

                context("when size is heading4") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading4, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.heading4))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }

                context("when size is heading5") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading5, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.heading5))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }

                context("when size is heading6") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading6, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.heading6))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }

                context("when size is subtitle1") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .subtitle1, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.subtitle1))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }

                context("when size is subtitle2") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .subtitle2, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.subtitle2))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }

                context("when size is body1") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .body1, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.body1))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }

                context("when size is body2") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .body2, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.body2))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }

                context("when size is button") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .button, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.button))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }

                context("when size is caption") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .caption, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.caption))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }

                context("when size is overline") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .overline, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.overline))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.regular))
                    }
                }
            } // context - when weight is .regular

            context("when weight is .medium") {
                context("when size is heading1") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading1, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.heading1))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }

                context("when size is heading2") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading2, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.heading2))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }

                context("when size is heading3") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading3, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.heading3))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }

                context("when size is heading4") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading4, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.heading4))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }

                context("when size is heading5") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading5, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.heading5))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }

                context("when size is heading6") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading6, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.heading6))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }

                context("when size is subtitle1") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .subtitle1, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.subtitle1))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }

                context("when size is subtitle2") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .subtitle2, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.subtitle2))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }

                context("when size is body1") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .body1, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.body1))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }

                context("when size is body2") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .body2, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.body2))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }

                context("when size is button") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .button, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.button))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }

                context("when size is caption") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .caption, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.caption))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }

                context("when size is overline") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .overline, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        expect(font.pointSize).to(equal(expectedSizes.overline))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(expectedWights.medium))
                    }
                }
            } // context - when weight is .medium
        }
    }
}
