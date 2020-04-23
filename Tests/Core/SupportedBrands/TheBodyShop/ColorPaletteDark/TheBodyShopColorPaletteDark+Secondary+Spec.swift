import Quick
import Nimble

@testable import NatDS

final class TheBodyShopColorPaletteDarkSecondarySpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopColorPaletteDark.Secondary()

        describe("#secondary") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.secondary
                let expectedHex = "#D2AD93"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSecondary") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onSecondary
                let expectedHex = "#000000"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#secondaryLight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.secondaryLight
                let expectedHex = "#FFDFC4"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSecondaryLight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onSecondaryLight
                let expectedHex = "#000000"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#secondaryDark") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.secondaryDark
                let expectedHex = "#A07E65"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSecondaryDark") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onSecondaryDark
                let expectedHex = "#000000"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }
    }
}
