import Quick
import Nimble

@testable import NatDS

final class TextFieldInteractionStatesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TextField.InteractionState.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }

        describe("#all interaction states") {
            it("has 5 possible states") {
                expect(systemUnderTest.allCases.count).to(equal(5))
            }
        }
    }
}
