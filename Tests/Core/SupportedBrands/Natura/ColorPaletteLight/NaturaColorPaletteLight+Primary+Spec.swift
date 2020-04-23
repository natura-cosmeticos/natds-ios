import Quick
import Nimble

@testable import NatDS

final class NaturaColorPaletteLightPrimarySpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaColorPaletteLight.Primary()

        describe("#primary") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.primary
                let expectedHex = "#F4AB34"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onPrimary") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onPrimary
                let expectedHex = "#333333"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#primaryLight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.primaryLight
                let expectedHex = "#FEFDE8"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onPrimaryLight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onPrimaryLight
                let expectedHex = "#333333"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#primaryDark") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.primaryDark
                let expectedHex = "#EF8426"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onPrimaryDark") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onPrimaryDark
                let expectedHex = "#333333"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }
    }
}
