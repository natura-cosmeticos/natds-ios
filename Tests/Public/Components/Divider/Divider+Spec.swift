import Quick
import Nimble

@testable import NatDS

final class DividerSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: Divider!

        describe("#init") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = StubTheme()

                systemUnderTest = Divider()
                systemUnderTest.configure(style: .fullBleed)
            }

            it("returns an expected backgroundColor") {
                let dividerView = systemUnderTest.subviews.first

                expect(dividerView?.backgroundColor).to(equal(NatColors.lowEmphasis))
            }
        }
    }
}
