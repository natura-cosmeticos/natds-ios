import Quick
import Nimble

@testable import NatDS

final class NaturaThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaTheme()

        describe("#colors") {
            it("returns a instance of DynamicColors") {
                let colorPalette = systemUnderTest.colors

                expect(colorPalette).to(beAnInstanceOf(DynamicColors.self))
            }
        }

        describe("#sizes") {
            it("returns a instance of NaturaSizes") {
                let sizes = systemUnderTest.sizes

                expect(sizes).to(beAnInstanceOf(NaturaSizes.self))
            }
        }

        describe("#spacing") {
            it("returns a instance of NaturaSpacing") {
                let spacing = systemUnderTest.spacing

                expect(spacing).to(beAnInstanceOf(NaturaSpacing.self))
            }
        }

        describe("#borderRadius") {
            it("returns a instance of NaturaBorderRadius") {
                let borderRadius = systemUnderTest.borderRadius

                expect(borderRadius).to(beAnInstanceOf(NaturaBorderRadius.self))
            }
        }

        describe("#opacities") {
            it("returns a instance of NaturaOpacities") {
                let opacities = systemUnderTest.opacities

                expect(opacities).to(beAnInstanceOf(NaturaOpacities.self))
            }
        }

        describe("#font") {
            it("returns a instance of NaturaFont") {
                let font = systemUnderTest.font

                expect(font).to(beAnInstanceOf(NaturaFont.self))
            }
        }

        describe("#elevations") {
            it("returns a instance of NaturaElevations") {
                let elevations = systemUnderTest.elevations

                expect(elevations).to(beAnInstanceOf(NaturaElevations.self))
            }
        }
    }
}
