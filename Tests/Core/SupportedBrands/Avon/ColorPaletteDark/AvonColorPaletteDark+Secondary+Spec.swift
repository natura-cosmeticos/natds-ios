import Quick
import Nimble

@testable import NatDS

final class AvonColorPaletteDarkSecondarySpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonColorPaletteDark.Secondary()

        describe("#secondary") {
            it("returns a string of a color hex expected for secondary color") {
                let colorHex = systemUnderTest.secondary
                let expectedHex = "#E9E9E9"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSecondary") {
            it("returns a string of a color hex expected for onSecondary color") {
                let colorHex = systemUnderTest.onSecondary
                let expectedHex = "#333333"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#secondaryLight") {
            it("returns a string of a color hex expected for secondaryLight color") {
                let colorHex = systemUnderTest.secondaryLight
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSecondaryLight") {
            it("returns a string of a color hex expected for onSecondaryLight color") {
                let colorHex = systemUnderTest.onSecondaryLight
                let expectedHex = "#333333"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#secondaryDark") {
            it("returns a string of a color hex expected for secondaryDark color") {
                let colorHex = systemUnderTest.secondaryDark
                let expectedHex = "#B7B7B7"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSecondaryDark") {
            it("returns a string of a color hex expected for onSecondaryDark color") {
                let colorHex = systemUnderTest.onSecondaryDark
                let expectedHex = "#333333"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }
    }
}
