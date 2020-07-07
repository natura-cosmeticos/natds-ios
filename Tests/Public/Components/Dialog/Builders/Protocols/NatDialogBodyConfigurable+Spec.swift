import Quick
import Nimble

@testable import NatDS

private typealias SystemUnderTest = NatDialogBodyConfigurable & NatDialogBuilder

final class NatDialogBodyConfigurableSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: SystemUnderTest!
        var viewModel: NatDialogController.ViewModel!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)

            systemUnderTest = StubClassWithProtocols()
            viewModel = systemUnderTest.viewModel
        }

        describe("#configure(body:)") {
            beforeEach {
                systemUnderTest.configure(body: "Stub Text")
            }

            it("sets bodyView") {
                expect(viewModel.bodyView).toNot(beNil())
            }

            it("does not set titleView") {
                expect(viewModel.titleView).to(beNil())
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

private final class StubClassWithProtocols: SystemUnderTest {
    var viewModel = NatDialogController.ViewModel()
    var buttonsConfiguration: (primary: DialogButtonConfiguration?, secondary: DialogButtonConfiguration?)
}
