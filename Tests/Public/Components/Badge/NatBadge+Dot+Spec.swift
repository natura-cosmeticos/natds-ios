import Quick
import Nimble

@testable import NatDS

final class NatBadgeDotSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatBadge!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = NatBadge(style: .dot, color: .alert)
        }

        describe("#configureDot()") {

            beforeEach {
                systemUnderTest.configure(showDot: true)
            }

            it("hides badge") {
                expect(systemUnderTest?.isHidden).to(beFalse())
            }
        }
    }
}
