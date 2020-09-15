import Quick
import Nimble

@testable import NatDS

final class NatDialogControllerSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatDialogController!

        describe("#init") {
            let stubView = UIView()

            beforeEach {
                ConfigurationStorage.shared.currentTheme = StubTheme()

                let viewModel = NatDialogController.ViewModel()
                viewModel.bodyView = stubView
                systemUnderTest = NatDialogController(viewModel: viewModel)
            }

            it("sets passed view as subview") {
                let containerView = systemUnderTest.view.subviews.first
                let stackView = containerView?.subviews.first

                expect(stackView?.subviews.first).to(equal(stubView))
            }

            it("sets presentationStyle to expected") {
                expect(systemUnderTest.modalPresentationStyle).to(equal(.overCurrentContext))
            }

            it("sets modalTransitionStyle to expected") {
                expect(systemUnderTest.modalTransitionStyle).to(equal(.crossDissolve))
            }

            it("sets view.backgroundColor to expected") {
                let opacity = getTokenFromTheme(\.opacity08)
                let expectedColor = UIColor.black.withAlphaComponent(opacity)

                expect(systemUnderTest.view.backgroundColor).to(equal(expectedColor))
            }
        }
    }
}
