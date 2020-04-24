import Quick
import Nimble

@testable import NatDS

final class TheBodyShopColorPaletteLightPrimarySpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopColorPaletteLight.Primary()

        describe("#primary") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.primary
                let expectedHex = "#004236"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onPrimary") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onPrimary
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#primaryLight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.primaryLight
                let expectedHex = "#356D60"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onPrimaryLight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onPrimaryLight
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#primaryDark") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.primaryDark
                let expectedHex = "#001D10"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onPrimaryDark") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onPrimaryDark
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }
    }
}
