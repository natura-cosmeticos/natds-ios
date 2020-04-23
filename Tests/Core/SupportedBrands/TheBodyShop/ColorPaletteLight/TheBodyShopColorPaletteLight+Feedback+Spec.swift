import Quick
import Nimble

@testable import NatDS

final class TheBodyShopColorPaletteLightFeedbackSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopColorPaletteLight.Feedback()

        describe("#success") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.success
                let expectedHex = "#569A32"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSuccess") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onSuccess
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#warning") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.warning
                let expectedHex = "#FCC433"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onWarning") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onWarning
                let expectedHex = "#333333"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#alert") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.alert
                let expectedHex = "#E74627"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onAlert") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onAlert
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }
    }
}
