import Quick
import Nimble

@testable import NatDS

final class TheBodyShopFontLetterSpacingsSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopFontLetterSpacings()

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
        }

        describe("#heading1") {
            it("returns a expect value") {
                expect(systemUnderTest.heading1).to(equal(0))
            }
        }

        describe("#heading2") {
            it("returns a expect value") {
                expect(systemUnderTest.heading2).to(equal(0))
            }
        }

        describe("#heading3") {
            it("returns a expect value") {
                expect(systemUnderTest.heading3).to(equal(0))
            }
        }

        describe("#heading4") {
            it("returns a expect value") {
                expect(systemUnderTest.heading4).to(equal(0.08))
            }
        }

        describe("#heading5") {
            it("returns a expect value") {
                expect(systemUnderTest.heading5).to(equal(0))
            }
        }

        describe("#heading6") {
            it("returns a expect value") {
                expect(systemUnderTest.heading6).to(equal(0.12))
            }
        }

        describe("#subtitle1") {
            it("returns a expect value") {
                expect(systemUnderTest.subtitle1).to(equal(0.08))
            }
        }

        describe("#subtitle2") {
            it("returns a expect value") {
                expect(systemUnderTest.subtitle2).to(equal(0.08))
            }
        }

        describe("#body1") {
            it("returns a expect value") {
                expect(systemUnderTest.body1).to(equal(0.32))
            }
        }

        describe("#body2") {
            it("returns a expect value") {
                expect(systemUnderTest.body2).to(equal(0.16))
            }
        }

        describe("#button") {
            it("returns a expect value") {
                expect(systemUnderTest.button).to(equal(0.44))
            }
        }

        describe("#caption") {
            it("returns a expect value") {
                expect(systemUnderTest.caption).to(equal(0.16))
            }
        }

        describe("#overline") {
            it("returns a expect value") {
                expect(systemUnderTest.overline).to(equal(0.8))
            }
        }
    }
}
