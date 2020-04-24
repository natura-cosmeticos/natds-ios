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
    }
}
