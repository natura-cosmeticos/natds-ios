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
    }
}
