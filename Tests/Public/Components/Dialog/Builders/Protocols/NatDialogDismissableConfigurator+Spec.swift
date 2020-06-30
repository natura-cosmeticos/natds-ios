import Quick
import Nimble

@testable import NatDS

final class NatDialogDismissableConfiguratorSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: StubClassWithProtocol!
        var viewModel: NatDialogController.ViewModel!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            systemUnderTest = StubClassWithProtocol()
            viewModel = systemUnderTest.viewModel
        }

        describe("#configure(isDismissable:)") {
            context("when isDismissable is false") {
                beforeEach {
                    _ = systemUnderTest.configure(isDismissable: false)
                }

                it("does not set titleView") {
                    expect(viewModel.titleView).to(beNil())
                }

                it("does not set bodyView") {
                    expect(viewModel.bodyView).to(beNil())
                }

                it("does not set footerView") {
                    expect(viewModel.footerView).to(beNil())
                }

                it("sets isDismissable to false") {
                    expect(systemUnderTest.viewModel.isDismissable).to(beFalse())
                }
            }

            context("when isDismissable is false") {

                it("does not set titleView") {
                    expect(viewModel.titleView).to(beNil())
                }

                it("does not set bodyView") {
                    expect(viewModel.bodyView).to(beNil())
                }

                it("does not set footerView") {
                    expect(viewModel.footerView).to(beNil())
                }

                it("sets isDismissable to false") {
                    _ = systemUnderTest.configure(isDismissable: true)

                    expect(systemUnderTest.viewModel.isDismissable).to(beTrue())
                }
            }
        }
    }
}

private final class StubClassWithProtocol: NatDialogDismissableConfigurator, NatDialogBuilder {
    var viewModel = NatDialogController.ViewModel()
    var buttonsConfiguration: (primary: DialogButtonConfiguration?, secondary: DialogButtonConfiguration?)
}
