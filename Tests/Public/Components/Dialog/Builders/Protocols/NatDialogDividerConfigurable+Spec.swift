import Quick
import Nimble

@testable import NatDS

private typealias SystemUnderTest = NatDialogDividerConfigurable & NatDialogBuilder

final class NatDialogDividerConfigurableSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: SystemUnderTest!
        var viewModel: NatDialogController.ViewModel!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = StubClassWithProtocols()
            viewModel = systemUnderTest.viewModel
        }

        describe("#configure(divider:)") {
            beforeEach {
                let someValue = false
                systemUnderTest.configure(divider: someValue)
            }

            context("when divider is false") {
                beforeEach {
                    systemUnderTest.configure(divider: false)
                }
                it("doesn't have top divider view") {
                    expect(systemUnderTest.viewModel.topDividerView).to(beNil())
                }

                it("doesn't have bottom divider view") {
                    expect(systemUnderTest.viewModel.topDividerView).to(beNil())
                }
            }

            context("when divider is true") {
                beforeEach {
                    systemUnderTest.configure(divider: true)
                }
                it("adds top divider view") {
                    expect(systemUnderTest.viewModel.topDividerView).toNot(beNil())
                }

                it("adds bottom divider view") {
                    expect(systemUnderTest.viewModel.topDividerView).toNot(beNil())
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

private final class StubClassWithProtocols: NatDialogDividerConfigurable, NatDialogBuilder {
    var viewModel = NatDialogController.ViewModel()
    var buttonsConfiguration: (primary: DialogButtonConfiguration?, secondary: DialogButtonConfiguration?)
}
