import Quick
import Nimble

@testable import NatDS

final class NatDialogCustomBodyConfigurableSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: StubClassWithProtocol!
        var viewModel: NatDialogController.ViewModel!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            systemUnderTest = StubClassWithProtocol()
            viewModel = systemUnderTest.viewModel
        }

        describe("#configure(body:)") {
            let stubView = UIView()

            beforeEach {
                _ = systemUnderTest.configure(body: stubView)
            }

            it("does not set titleView") {
                expect(viewModel.titleView).to(beNil())
            }

            it("sets bodyView") {
                expect(viewModel.bodyView).toNot(beNil())
            }

            it("sets bodyView to an expected view") {
                let expectedView = systemUnderTest.viewModel.bodyView

                expect(expectedView).to(equal(stubView))
            }

            it("does not set footerView") {
                expect(viewModel.footerView).to(beNil())
            }

            it("does not set isDismissable to false") {
                expect(systemUnderTest.viewModel.isDismissable).to(beTrue())
            }
        }
    }
}

private final class StubClassWithProtocol: NatDialogCustomBodyConfigurable, NatDialogBuilder {
    var viewModel = NatDialogController.ViewModel()
    var buttonsConfiguration: (primary: DialogButtonConfiguration?, secondary: DialogButtonConfiguration?)
}
