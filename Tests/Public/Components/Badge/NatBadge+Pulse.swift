import Quick
import Nimble

@testable import NatDS

final class NatBadgePulseSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatBadge!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = NatBadge(style: .pulse, color: .alert)
        }

        describe("#configureDot()") {
            it("hides badge") {
                expect(systemUnderTest?.isHidden).to(beFalse())
            }
        }
    }
}
