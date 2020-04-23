import Quick
import Nimble

@testable import NatDS

final class AvonColorPaletteDarktSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonColorPaletteDark()

        describe("#primary") {
            it("returns a instance of AvonColorPaletteDark.Primary") {
                let colorPalette = systemUnderTest.primary
                expect(colorPalette).to(beAnInstanceOf(AvonColorPaletteDark.Primary.self))
            }
        }

        describe("#secondary") {
            it("returns a instance of AvonColorPaletteDark.Secondary") {
                let colorPalette = systemUnderTest.secondary
                expect(colorPalette).to(beAnInstanceOf(AvonColorPaletteDark.Secondary.self))
            }
        }

        describe("#surface") {
            it("returns a instance of AvonColorPaletteLight.Surface") {
                let colorPalette = systemUnderTest.surface
                expect(colorPalette).to(beAnInstanceOf(AvonColorPaletteDark.Surface.self))
            }
        }

        describe("#surface") {
            it("returns a instance of AvonColorPaletteDark.Content") {
                let colorPalette = systemUnderTest.content
                expect(colorPalette).to(beAnInstanceOf(AvonColorPaletteDark.Content.self))
            }
        }

        describe("#surface") {
            it("returns a instance of AvonColorPaletteDark.Feedback") {
                let colorPalette = systemUnderTest.feedback
                expect(colorPalette).to(beAnInstanceOf(AvonColorPaletteDark.Feedback.self))
            }
        }
    }
}
