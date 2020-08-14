import Quick
import Nimble

@testable import NatDS

final class AvonLightThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonLightTheme()

        describe("#init") {
            it("initializes tokens with AvonLightTokens") {
                expect(systemUnderTest.tokens).to(beAnInstanceOf(AvonLightTokens.self))
            }

            it("initializes components with AvonLightComponents") {
                expect(systemUnderTest.components).to(beAnInstanceOf(AvonLightComponents.self))
            }
        }
    }
}
