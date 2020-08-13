import Quick
import Nimble

@testable import NatDS

final class AvonDarkThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonDarkTheme()

        describe("#init") {
            it("initializes tokens with AvonDarkTokens") {
                expect(systemUnderTest.tokens).to(beAnInstanceOf(AvonDarkTokens.self))
            }

            it("initializes components with AvonDarkComponents") {
                expect(systemUnderTest.components).to(beAnInstanceOf(AvonDarkComponents.self))
            }
        }
    }
}
