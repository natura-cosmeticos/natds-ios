import Quick
import Nimble

@testable import NatDS

final class NatShortcutWidthsSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatShortcut.Widths.self

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
        }

        describe("#small") {
            it("returns expected maximum") {
                expect(systemUnderTest.maximum).to(equal(getTheme().sizes.large))
            }
        }
    }
}
