import Quick
import Nimble

@testable import NatDS

final class AvonColorPaletteDarkContentSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonColorPaletteDark.Content()

        describe("#highlight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.highlight
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#highEmphasis") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.highEmphasis
                let expectedHex = "#FAFAFA"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#mediumEmphasis") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.mediumEmphasis
                let expectedHex = "#BBBBBB"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#lowEmphasis") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.lowEmphasis
                let expectedHex = "#777777"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }
    }
}
