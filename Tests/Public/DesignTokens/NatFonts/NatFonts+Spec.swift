import Quick
import Nimble

@testable import NatDS

final class NatFontsSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatFonts.self
        var font: UIFont!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }

        describe("#font") {
            context("when weight is .regular") {
                context("when size is heading1") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading1, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.heading1FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.regular))
                    }
                }

                context("when size is heading2") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading2, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.heading2FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.regular))
                    }
                }

                context("when size is heading3") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading3, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.heading3FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.regular))
                    }
                }

                context("when size is heading4") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading4, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.heading4FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.regular))
                    }
                }

                context("when size is heading5") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading5, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.heading5FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.regular))
                    }
                }

                context("when size is heading6") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading6, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.heading6FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.regular))
                    }
                }

                context("when size is subtitle1") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .subtitle1, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.subtitle1FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.regular))
                    }
                }

                context("when size is subtitle2") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .subtitle2, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.subtitle2FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.regular))
                    }
                }

                context("when size is body1") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .body1, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.body1FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.regular))
                    }
                }

                context("when size is body2") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .body2, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.body2FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.regular))
                    }
                }

                context("when size is caption") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .caption, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.captionFontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.regular))
                    }
                }

                context("when size is overline") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .overline, withWeight: .regular)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.overlineFontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.regular))
                    }
                }
            } // context - when weight is .regular

            context("when weight is .medium") {
                context("when size is heading1") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading1, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.heading1FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.medium))
                    }
                }

                context("when size is heading2") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading2, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.heading2FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.medium))
                    }
                }

                context("when size is heading3") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading3, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.heading3FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.medium))
                    }
                }

                context("when size is heading4") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading4, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.heading4FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.medium))
                    }
                }

                context("when size is heading5") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading5, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.heading5FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.medium))
                    }
                }

                context("when size is heading6") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .heading6, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.heading6FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.medium))
                    }
                }

                context("when size is subtitle1") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .subtitle1, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.subtitle1FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.medium))
                    }
                }

                context("when size is subtitle2") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .subtitle2, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.subtitle2FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.medium))
                    }
                }

                context("when size is body1") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .body1, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.body1FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.medium))
                    }
                }

                context("when size is body2") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .body2, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.body2FontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.medium))
                    }
                }

                context("when size is caption") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .caption, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.captionFontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.medium))
                    }
                }

                context("when size is overline") {
                    beforeEach {
                        font = systemUnderTest.font(ofSize: .overline, withWeight: .medium)
                    }

                    it("returns a expect value for size") {
                        let expected = getComponentAttributeFromTheme(\.overlineFontSize)

                        expect(font.pointSize).to(equal(expected))
                    }

                    it("returns a expect value for weight") {
                        expect(font.getWeight()).to(equal(.medium))
                    }
                }
            } // context - when weight is .medium
        }
    }
}
