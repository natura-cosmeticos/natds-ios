import Quick
import Nimble

@testable import NatDS

final class AvonColorPaletteLightPrimarySpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonColorPaletteLight.Primary()

        describe("#primary") {
            it("returns a string of a color hex expected for primary color") {
                let colorHex = systemUnderTest.primary
                let expectedHex = "#DE0085"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onPrimary") {
            it("returns a string of a color hex expected for onPrimary color") {
                let colorHex = systemUnderTest.onPrimary
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#primaryLight") {
            it("returns a string of a color hex expected for primaryLight color") {
                let colorHex = systemUnderTest.primaryLight
                let expectedHex = "#FF56B5"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onPrimaryLight") {
            it("returns a string of a color hex expected for onPrimaryLight color") {
                let colorHex = systemUnderTest.onPrimaryLight
                let expectedHex = "#000000"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#primaryDark") {
            it("returns a string of a color hex expected for primaryDark color") {
                let colorHex = systemUnderTest.primaryDark
                let expectedHex = "#A70058"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onPrimaryDark") {
            it("returns a string of a color hex expected for onPrimaryDark color") {
                let colorHex = systemUnderTest.onPrimaryDark
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }
    }
}
