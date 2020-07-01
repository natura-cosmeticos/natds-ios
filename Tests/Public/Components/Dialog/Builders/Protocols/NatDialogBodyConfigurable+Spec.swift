import Quick
import Nimble

@testable import NatDS

final class NatDialogBodyConfigurableSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: StubClassWithProtocol!
        var viewModel: NatDialogController.ViewModel!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            systemUnderTest = StubClassWithProtocol()
            viewModel = systemUnderTest.viewModel
        }

        describe("#configure(body:)") {
            beforeEach {
                _ = systemUnderTest.configure(body: "Stub Text")
            }

            it("does not set titleView") {
                expect(viewModel.titleView).to(beNil())
            }

            it("sets bodyView") {
                expect(viewModel.bodyView).toNot(beNil())
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

private final class StubClassWithProtocol: NatDialogBodyConfigurable, NatDialogBuilder {
    var viewModel = NatDialogController.ViewModel()
    var buttonsConfiguration: (primary: DialogButtonConfiguration?, secondary: DialogButtonConfiguration?)
}
