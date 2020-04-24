import Quick
import Nimble

@testable import NatDS

final class TheBodyShopColorPaletteDarkSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopColorPaletteDark()

        describe("#primary") {
            it("returns a instance of TheBodyShopColorPaletteDark.Primary") {
                let colorPalette = systemUnderTest.primary

                expect(colorPalette).to(beAnInstanceOf(TheBodyShopColorPaletteDark.Primary.self))
            }
        }

        describe("#secondary") {
            it("returns a instance of TheBodyShopColorPaletteDark.Secondary") {
                let colorPalette = systemUnderTest.secondary

                expect(colorPalette).to(beAnInstanceOf(TheBodyShopColorPaletteDark.Secondary.self))
            }
        }

        describe("#surface") {
            it("returns a instance of TheBodyShopColorPaletteLight.Surface") {
                let colorPalette = systemUnderTest.surface

                expect(colorPalette).to(beAnInstanceOf(TheBodyShopColorPaletteDark.Surface.self))
            }
        }

        describe("#content") {
            it("returns a instance of TheBodyShopColorPaletteDark.Content") {
                let colorPalette = systemUnderTest.content

                expect(colorPalette).to(beAnInstanceOf(TheBodyShopColorPaletteDark.Content.self))
            }
        }

        describe("#feedback") {
            it("returns a instance of TheBodyShopColorPaletteDark.Feedback") {
                let colorPalette = systemUnderTest.feedback

                expect(colorPalette).to(beAnInstanceOf(TheBodyShopColorPaletteDark.Feedback.self))
            }
        }
    }
}
