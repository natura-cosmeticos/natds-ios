import Quick
import Nimble

@testable import NatDS

final class AvonColorPaletteLightSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonColorPaletteLight()

        describe("#primary") {
            it("returns a instance of AvonColorPaletteLight.Primary") {
                let colorPalette = systemUnderTest.primary
                expect(colorPalette).to(beAnInstanceOf(AvonColorPaletteLight.Primary.self))
            }
        }

        describe("#secondary") {
            it("returns a instance of AvonColorPaletteLight.Secondary") {
                let colorPalette = systemUnderTest.secondary
                expect(colorPalette).to(beAnInstanceOf(AvonColorPaletteLight.Secondary.self))
            }
        }

        describe("#surface") {
            it("returns a instance of AvonColorPaletteLight.Surface") {
                let colorPalette = systemUnderTest.surface
                expect(colorPalette).to(beAnInstanceOf(AvonColorPaletteLight.Surface.self))
            }
        }

        describe("#surface") {
            it("returns a instance of AvonColorPaletteLight.Content") {
                let colorPalette = systemUnderTest.content
                expect(colorPalette).to(beAnInstanceOf(AvonColorPaletteLight.Content.self))
            }
        }

        describe("#surface") {
            it("returns a instance of AvonColorPaletteLight.Feedback") {
                let colorPalette = systemUnderTest.feedback
                expect(colorPalette).to(beAnInstanceOf(AvonColorPaletteLight.Feedback.self))
            }
        }
    }
}
