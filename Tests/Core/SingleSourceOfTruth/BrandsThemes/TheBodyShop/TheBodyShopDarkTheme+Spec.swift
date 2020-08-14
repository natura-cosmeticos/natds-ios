import Quick
import Nimble

@testable import NatDS

final class TheBodyShopDarkThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopDarkTheme()

        describe("#init") {
            it("initializes tokens with TheBodyShopDarkTokens") {
                expect(systemUnderTest.tokens).to(beAnInstanceOf(TheBodyShopDarkTokens.self))
            }

            it("initializes components with TheBodyShopDarkComponents") {
                expect(systemUnderTest.components).to(beAnInstanceOf(TheBodyShopDarkComponents.self))
            }
        }
    }
}
