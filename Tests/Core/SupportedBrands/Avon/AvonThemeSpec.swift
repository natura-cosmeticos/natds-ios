import Quick
import Nimble

@testable import NatDS

final class AvonThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonTheme()

        describe("#font") {
            it("returns a instance of AvonFont") {
                let font = systemUnderTest.font

                expect(font).to(beAnInstanceOf(AvonFont.self))
            }
        }
    }
}
