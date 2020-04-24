import Quick
import Nimble

@testable import NatDS

final class NaturaColorPaletteLightSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaColorPaletteLight()

        describe("#primary") {
            it("returns a instance of NaturaColorPaletteLight.Primary") {
                let colorPalette = systemUnderTest.primary

                expect(colorPalette).to(beAnInstanceOf(NaturaColorPaletteLight.Primary.self))
            }
        }

        describe("#secondary") {
            it("returns a instance of NaturaColorPaletteLight.Secondary") {
                let colorPalette = systemUnderTest.secondary

                expect(colorPalette).to(beAnInstanceOf(NaturaColorPaletteLight.Secondary.self))
            }
        }

        describe("#surface") {
            it("returns a instance of NaturaColorPaletteLight.Surface") {
                let colorPalette = systemUnderTest.surface

                expect(colorPalette).to(beAnInstanceOf(NaturaColorPaletteLight.Surface.self))
            }
        }

        describe("#content") {
            it("returns a instance of NaturaColorPaletteLight.Content") {
                let colorPalette = systemUnderTest.content

                expect(colorPalette).to(beAnInstanceOf(NaturaColorPaletteLight.Content.self))
            }
        }

        describe("#feedback") {
            it("returns a instance of NaturaColorPaletteLight.Feedback") {
                let colorPalette = systemUnderTest.feedback

                expect(colorPalette).to(beAnInstanceOf(NaturaColorPaletteLight.Feedback.self))
            }
        }
    }
}
