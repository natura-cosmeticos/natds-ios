import Quick
import Nimble

@testable import NatDS

final class TheBodyShopColorPaletteLightSecondarySpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopColorPaletteLight.Secondary()

        describe("#secondary") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.secondary
                let expectedHex = "#A55F53"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSecondary") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onSecondary
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#secondaryLight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.secondaryLight
                let expectedHex = "#D98D7F"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSecondaryLight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onSecondaryLight
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#secondaryDark") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.secondaryDark
                let expectedHex = "#73342A"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSecondaryDark") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onSecondaryDark
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }
    }
}
