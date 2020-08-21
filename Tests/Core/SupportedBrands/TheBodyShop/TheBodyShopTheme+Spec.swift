import Quick
import Nimble

@testable import NatDS

final class TheBodyShopThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopTheme()

        describe("#font") {
            it("returns a instance of AvonFont") {
                let font = systemUnderTest.font

                expect(font).to(beAnInstanceOf(TheBodyShopFont.self))
            }
        }

        describe("#elevations") {
            it("returns a instance of TheBodyShopElevations") {
                let elevations = systemUnderTest.elevations

                expect(elevations).to(beAnInstanceOf(TheBodyShopElevations.self))
            }
        }
    }
}
