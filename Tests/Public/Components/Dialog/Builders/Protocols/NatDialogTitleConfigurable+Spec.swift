import Quick
import Nimble

@testable import NatDS

final class NatDialogTitleConfigurableSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: StubClassWithProtocol!
        var viewModel: NatDialogController.ViewModel!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            systemUnderTest = StubClassWithProtocol()
            viewModel = systemUnderTest.viewModel
        }

        describe("#configure(title:)") {
            beforeEach {
                systemUnderTest.configure(title: "Stub Text")
            }

            it("sets titleView") {
                expect(viewModel.titleView).toNot(beNil())
            }

            it("does not set bodyView") {
                expect(viewModel.bodyView).to(beNil())
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

private final class StubClassWithProtocol: NatDialogTitleConfigurable, NatDialogBuilder {
    var viewModel = NatDialogController.ViewModel()
    var buttonsConfiguration: (primary: DialogButtonConfiguration?, secondary: DialogButtonConfiguration?)
}
