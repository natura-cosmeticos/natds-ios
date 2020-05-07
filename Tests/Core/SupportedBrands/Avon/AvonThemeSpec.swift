import Quick
import Nimble

@testable import NatDS

final class AvonThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonTheme()

        describe("#lightColorPalette") {
            it("returns a instance of AvonColorPaletteLight") {
                let colorPalette = systemUnderTest.lightColorPalette

                expect(colorPalette).to(beAnInstanceOf(AvonColorPaletteLight.self))
            }
        }

        describe("#darkColorPalette") {
            it("returns a instance of AvonColorPaletteDark") {
                let colorPalette = systemUnderTest.darkColorPalette

                expect(colorPalette).to(beAnInstanceOf(AvonColorPaletteDark.self))
            }
        }

        describe("#sizes") {
            it("returns a instance of AvonSizes") {
                let colorPalette = systemUnderTest.sizes

                expect(colorPalette).to(beAnInstanceOf(AvonSizes.self))
            }
        }

        describe("#spacing") {
            it("returns a instance of AvonSpacing") {
                let colorPalette = systemUnderTest.spacing

                expect(colorPalette).to(beAnInstanceOf(AvonSpacing.self))
            }
        }

        describe("#opacities") {
            it("returns a instance of AvonOpacities") {
                let colorPalette = systemUnderTest.opacities

                expect(colorPalette).to(beAnInstanceOf(AvonOpacities.self))
            }
        }
    }
}
