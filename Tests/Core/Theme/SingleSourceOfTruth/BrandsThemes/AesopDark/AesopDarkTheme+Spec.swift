import Quick
import Nimble

@testable import NatDS

final class AesopDarkThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AesopDarkTheme()

        describe("#init") {
            it("initializes tokens with AesopDarkTokens") {
                expect(systemUnderTest.tokens).to(beAnInstanceOf(AesopDarkTokens.self))
            }

            it("initializes components with AesopDarkComponents") {
                expect(systemUnderTest.components).to(beAnInstanceOf(AesopDarkComponents.self))
            }
        }
    }
}
