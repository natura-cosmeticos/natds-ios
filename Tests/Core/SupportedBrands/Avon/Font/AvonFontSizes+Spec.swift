import Quick
import Nimble

@testable import NatDS

final class AvonFontSizeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonFontSizes()

        beforeEach {
            DesignSystem().configure(with: .avon)
        }

        describe("#heading1") {
            it("returns a expect value") {
                expect(systemUnderTest.heading1).to(equal(96))
            }
        }

        describe("#heading2") {
            it("returns a expect value") {
                expect(systemUnderTest.heading2).to(equal(60))
            }
        }

        describe("#heading3") {
            it("returns a expect value") {
                expect(systemUnderTest.heading3).to(equal(48))
            }
        }

        describe("#heading4") {
            it("returns a expect value") {
                expect(systemUnderTest.heading4).to(equal(34))
            }
        }

        describe("#heading5") {
            it("returns a expect value") {
                expect(systemUnderTest.heading5).to(equal(24))
            }
        }

        describe("#heading6") {
            it("returns a expect value") {
                expect(systemUnderTest.heading6).to(equal(20))
            }
        }

        describe("#subtitle1") {
            it("returns a expect value") {
                expect(systemUnderTest.subtitle1).to(equal(16))
            }
        }

        describe("#subtitle2") {
            it("returns a expect value") {
                expect(systemUnderTest.subtitle2).to(equal(14))
            }
        }

        describe("#body1") {
            it("returns a expect value") {
                expect(systemUnderTest.body1).to(equal(16))
            }
        }

        describe("#body2") {
            it("returns a expect value") {
                expect(systemUnderTest.body2).to(equal(14))
            }
        }

        describe("#button") {
            it("returns a expect value") {
                expect(systemUnderTest.button).to(equal(14))
            }
        }

        describe("#caption") {
            it("returns a expect value") {
                expect(systemUnderTest.caption).to(equal(12))
            }
        }

        describe("#overline") {
            it("returns a expect value") {
                expect(systemUnderTest.overline).to(equal(12))
            }
        }
    }
}
