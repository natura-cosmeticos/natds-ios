import Quick
import Nimble

@testable import NatDS

final class NaturaDarkThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaDarkTheme()

        describe("#init") {
            it("initializes tokens with NaturaDarkTokens") {
                expect(systemUnderTest.tokens).to(beAnInstanceOf(NaturaDarkTokens.self))
            }

            it("initializes components with NaturaDarkComponents") {
                expect(systemUnderTest.components).to(beAnInstanceOf(NaturaDarkComponents.self))
            }
        }
    }
}
