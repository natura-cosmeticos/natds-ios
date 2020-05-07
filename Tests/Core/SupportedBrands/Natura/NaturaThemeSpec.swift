import Quick
import Nimble

@testable import NatDS

final class NaturaThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaTheme()

        describe("#lightColorPalette") {
            it("returns a instance of NaturaColorPaletteLight") {
                let colorPalette = systemUnderTest.lightColorPalette

                expect(colorPalette).to(beAnInstanceOf(NaturaColorPaletteLight.self))
            }
        }

        describe("#darkColorPalette") {
            it("returns a instance of NaturaColorPaletteDark") {
                let colorPalette = systemUnderTest.darkColorPalette

                expect(colorPalette).to(beAnInstanceOf(NaturaColorPaletteDark.self))
            }
        }

        describe("#sizes") {
            it("returns a instance of NaturaSizes") {
                let colorPalette = systemUnderTest.sizes

                expect(colorPalette).to(beAnInstanceOf(NaturaSizes.self))
            }
        }

        describe("#spacing") {
            it("returns a instance of NaturaSpacing") {
                let colorPalette = systemUnderTest.spacing

                expect(colorPalette).to(beAnInstanceOf(NaturaSpacing.self))
            }
        }

        describe("#borderRadius") {
            it("returns a instance of NaturaBorderRadius") {
                let colorPalette = systemUnderTest.borderRadius

                expect(colorPalette).to(beAnInstanceOf(NaturaBorderRadius.self))
            }
        }

        describe("#opacities") {
            it("returns a instance of NaturaOpacities") {
                let colorPalette = systemUnderTest.opacities

                expect(colorPalette).to(beAnInstanceOf(NaturaOpacities.self))
            }
        }
    }
}
