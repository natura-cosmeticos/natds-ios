import Quick
import Nimble

@testable import NatDS

final class NaturaColorPaletteDarkSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaColorPaletteDark()

        describe("#primary") {
            it("returns a instance of NaturaColorPaletteDark.Primary") {
                let colorPalette = systemUnderTest.primary
                expect(colorPalette).to(beAnInstanceOf(NaturaColorPaletteDark.Primary.self))
            }
        }

        describe("#secondary") {
            it("returns a instance of NaturaColorPaletteDark.Secondary") {
                let colorPalette = systemUnderTest.secondary
                expect(colorPalette).to(beAnInstanceOf(NaturaColorPaletteDark.Secondary.self))
            }
        }

        describe("#surface") {
            it("returns a instance of NaturaColorPaletteLight.Surface") {
                let colorPalette = systemUnderTest.surface
                expect(colorPalette).to(beAnInstanceOf(NaturaColorPaletteDark.Surface.self))
            }
        }

        describe("#surface") {
            it("returns a instance of NaturaColorPaletteDark.Content") {
                let colorPalette = systemUnderTest.content
                expect(colorPalette).to(beAnInstanceOf(NaturaColorPaletteDark.Content.self))
            }
        }

        describe("#surface") {
            it("returns a instance of NaturaColorPaletteDark.Feedback") {
                let colorPalette = systemUnderTest.feedback
                expect(colorPalette).to(beAnInstanceOf(NaturaColorPaletteDark.Feedback.self))
            }
        }
    }
}
