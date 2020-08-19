import Quick
import Nimble

@testable import NatDS

final class TheBodyShopLightThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopLightTheme()

        describe("#init") {
            it("initializes tokens with TheBodyShopLightTokens") {
                expect(systemUnderTest.tokens).to(beAnInstanceOf(TheBodyShopLightTokens.self))
            }

            it("initializes components with TheBodyShopLightComponents") {
                expect(systemUnderTest.components).to(beAnInstanceOf(TheBodyShopLightComponents.self))
            }
        }
    }
}
