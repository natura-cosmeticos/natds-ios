import Quick
import Nimble

@testable import NatDS

final class NaturaThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaTheme()

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
