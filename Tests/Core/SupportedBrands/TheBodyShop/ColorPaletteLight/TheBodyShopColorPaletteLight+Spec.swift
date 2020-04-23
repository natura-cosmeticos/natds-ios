import Quick
import Nimble

@testable import NatDS

final class TheBodyShopColorPaletteLightSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopColorPaletteLight()

        describe("#primary") {
            it("returns a instance of TheBodyShopColorPaletteLight.Primary") {
                let colorPalette = systemUnderTest.primary
                expect(colorPalette).to(beAnInstanceOf(TheBodyShopColorPaletteLight.Primary.self))
            }
        }

        describe("#secondary") {
            it("returns a instance of TheBodyShopColorPaletteLight.Secondary") {
                let colorPalette = systemUnderTest.secondary
                expect(colorPalette).to(beAnInstanceOf(TheBodyShopColorPaletteLight.Secondary.self))
            }
        }

        describe("#surface") {
            it("returns a instance of TheBodyShopColorPaletteLight.Surface") {
                let colorPalette = systemUnderTest.surface
                expect(colorPalette).to(beAnInstanceOf(TheBodyShopColorPaletteLight.Surface.self))
            }
        }

        describe("#surface") {
            it("returns a instance of TheBodyShopColorPaletteLight.Content") {
                let colorPalette = systemUnderTest.content
                expect(colorPalette).to(beAnInstanceOf(TheBodyShopColorPaletteLight.Content.self))
            }
        }

        describe("#surface") {
            it("returns a instance of TheBodyShopColorPaletteLight.Feedback") {
                let colorPalette = systemUnderTest.feedback
                expect(colorPalette).to(beAnInstanceOf(TheBodyShopColorPaletteLight.Feedback.self))
            }
        }
    }
}
