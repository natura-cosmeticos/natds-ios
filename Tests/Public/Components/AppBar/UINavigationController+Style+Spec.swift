import Nimble
import Quick

@testable import NatDS

final class UINavigationControllerStyleSpec: QuickSpec {
    override func spec() {
        var sut: UINavigationController.Style!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
        }

        describe("#default") {
            beforeEach {
                sut = .default
            }
            it("returns expected color for background") {
                let expectedColor = getUIColorFromTokens(\.colorSurface)
                expect(sut.backgroundColor).to(equal(expectedColor))
            }
            it("returns expected color for title") {
                let expectedColor = getUIColorFromTokens(\.colorHighEmphasis)
                expect(sut.titleColor).to(equal(expectedColor))
            }
            it("returns expected elevation") {
                let expectedElevation = NatElevation.Elevation.elevation02
                expect(sut.elevation).to(equal(expectedElevation))
            }
        }
    }
}
