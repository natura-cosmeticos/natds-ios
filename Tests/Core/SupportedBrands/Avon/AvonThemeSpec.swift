import Quick
import Nimble

@testable import NatDS

final class AvonThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonTheme()

        describe("#colors") {
            it("returns a instance of DynamicColors") {
                let colorPalette = systemUnderTest.colors

                expect(colorPalette).to(beAnInstanceOf(DynamicColors.self))
            }
        }

        describe("#sizes") {
            it("returns a instance of AvonSizes") {
                let sizes = systemUnderTest.sizes

                expect(sizes).to(beAnInstanceOf(AvonSizes.self))
            }
        }

        describe("#spacing") {
            it("returns a instance of AvonSpacing") {
                let colorPalette = systemUnderTest.spacing

                expect(colorPalette).to(beAnInstanceOf(AvonSpacing.self))
            }
        }

        describe("#borderRadius") {
            it("returns a instance of AvonBorderRadius") {
                let borderRadius = systemUnderTest.borderRadius

                expect(borderRadius).to(beAnInstanceOf(AvonBorderRadius.self))
            }
        }

        describe("#opacities") {
            it("returns a instance of AvonOpacities") {
                let opacities = systemUnderTest.opacities

                expect(opacities).to(beAnInstanceOf(AvonOpacities.self))
            }
        }

        describe("#font") {
            it("returns a instance of AvonFont") {
                let font = systemUnderTest.font

                expect(font).to(beAnInstanceOf(AvonFont.self))
            }
        }

        describe("#elevations") {
            it("returns a instance of AvonElevations") {
                let elevations = systemUnderTest.elevations

                expect(elevations).to(beAnInstanceOf(AvonElevations.self))
            }
        }
    }
}
