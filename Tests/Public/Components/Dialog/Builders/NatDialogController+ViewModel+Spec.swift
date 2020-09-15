import Quick
import Nimble

@testable import NatDS

final class NatDialogControllerViewModelSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatDialogController.ViewModel!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = .init()
        }

        describe("#init") {
            it("has nil as default") {
                expect(systemUnderTest.titleView).to(beNil())
            }

            it("has nil as default") {
                expect(systemUnderTest.bodyView).to(beNil())
            }

            it("has nil as default") {
                expect(systemUnderTest.footerView).to(beNil())
            }

            it("has true as default") {
                expect(systemUnderTest.isDismissable).to(beTrue())
            }
        }
    }
}
