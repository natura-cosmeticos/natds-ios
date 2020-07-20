import Nimble
import Quick

@testable import NatDS

final class UINavigationControllerColorSpec: QuickSpec {
    override func spec() {
        var sut: UINavigationController.Color!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
        }

        describe("#default") {
            beforeEach {
                sut = .default
            }
            it("returns expected color for background") {
                let expectedColor = getTheme().colors.surface
                expect(sut.background).to(equal(expectedColor))
            }
            it("returns expected color for title") {
                let expectedColor = getTheme().colors.highEmphasis
                expect(sut.title).to(equal(expectedColor))
            }
        }
    }
}
