import Quick
import Nimble

@testable import NatDS

final class NaturaLightThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaLightTheme()

        describe("#init") {
            it("initializes tokens with NaturaLightTokens") {
                expect(systemUnderTest.tokens).to(beAnInstanceOf(NaturaLightTokens.self))
            }

            it("initializes components with NaturaLightComponents") {
                expect(systemUnderTest.components).to(beAnInstanceOf(NaturaLightComponents.self))
            }
        }
    }
}
