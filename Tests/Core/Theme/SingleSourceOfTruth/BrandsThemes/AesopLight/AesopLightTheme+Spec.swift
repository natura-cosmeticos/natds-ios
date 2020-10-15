import Quick
import Nimble

@testable import NatDS

final class AesopLightThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AesopLightTheme()

        describe("#init") {
            it("initializes tokens with AesopLightTokens") {
                expect(systemUnderTest.tokens).to(beAnInstanceOf(AesopLightTokens.self))
            }

            it("initializes components with AesopLightComponents") {
                expect(systemUnderTest.components).to(beAnInstanceOf(AesopLightComponents.self))
            }
        }
    }
}
