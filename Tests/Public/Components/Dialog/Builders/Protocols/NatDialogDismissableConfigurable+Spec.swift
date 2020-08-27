import Quick
import Nimble

@testable import NatDS

private typealias SystemUnderTest = NatDialogDismissableConfigurable & NatDialogBuilder

final class NatDialogDismissableConfigurableSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: SystemUnderTest!
        var viewModel: NatDialogController.ViewModel!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubThemeProtocol()

            systemUnderTest = StubClassWithProtocols()
            viewModel = systemUnderTest.viewModel
        }

        describe("#configure(isDismissable:)") {
            beforeEach {
                let someValue = false
                systemUnderTest.configure(isDismissable: someValue)
            }

            context("when isDismissable is false") {
                it("sets isDismissable to false") {
                    systemUnderTest.configure(isDismissable: false)

                    expect(systemUnderTest.viewModel.isDismissable).to(beFalse())
                }
            }

            context("when isDismissable is true") {
                it("sets isDismissable to true") {
                    systemUnderTest.configure(isDismissable: true)

                    expect(systemUnderTest.viewModel.isDismissable).to(beTrue())
                }
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
        }
    }
}

private final class StubClassWithProtocols: NatDialogDismissableConfigurable, NatDialogBuilder {
    var viewModel = NatDialogController.ViewModel()
    var buttonsConfiguration: (primary: DialogButtonConfiguration?, secondary: DialogButtonConfiguration?)
}
